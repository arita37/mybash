#!/usr/bin/env bash

#
#   Copyright 2016 Jason Wee
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.

JWMS_JENKINS_USERNAME=""
JWMS_JENKINS_API_TOKEN=""
JWMS_JENKINS_HOSTNAME=""
JWMS_JENKINS_JOB_NAME=""
JWMS_JENKINS_CRUMB=""
JWMS_CURL_PARAMETER=""

CURL="`which curl`"
HEXDUMP="`which hexdump`"

function _checkRequireFields {
   l_require=$1
   l_field=$2

   if [ -z "$l_require" ]; then
      echo "ERROR: $l_field parameter required"
      return 0
   fi
   return 1
}

function jwms_send {
  if [ $# -ne 5 ]; then
     echo "ERROR: five parameters required. hex binary, result, duration, display name and description."
     return 1
  fi

  l_hex_bin=$1
  l_result=$2
  l_duration=$3
  l_display_name=$4
  l_description=$5

  _checkRequireFields "$JWMS_JENKINS_USERNAME" "jenkins username" && return 1
  _checkRequireFields "$JWMS_JENKINS_API_TOKEN" "jenkins api token" && return 1
  _checkRequireFields "$JWMS_JENKINS_HOSTNAME" "jenkins hostname" && return 1
  _checkRequireFields "$JWMS_JENKINS_JOB_NAME" "jenkins job name" && return 1
  _checkRequireFields "$JWMS_JENKINS_CRUMB" "jenkins crumb" && return 1

  _checkRequireFields "$l_hex_bin" "hex binary" && return 1
  _checkRequireFields "$l_result" "result" && return 1
  _checkRequireFields "$l_duration" "duration" && return 1
  _checkRequireFields "$l_display_name" "display name" && return 1
  _checkRequireFields "$l_description" "description" && return 1

  l_hex_bin=`jwms_str_to_hex "$l_hex_bin"`

  $CURL $JWMS_CURL_PARAMETER -XPOST \
       -H"Jenkins-Crumb:$JWMS_JENKINS_CRUMB" \
       -u "$JWMS_JENKINS_USERNAME:$JWMS_JENKINS_API_TOKEN" \
       --data-binary "<run><log encoding=\"hexBinary\">$l_hex_bin</log><result>$l_result</result><duration>$l_duration</duration><displayName>$l_display_name</displayName><description>$l_description</description></run>" \
       "$JWMS_JENKINS_HOSTNAME/job/$JWMS_JENKINS_JOB_NAME/postBuildResult"
}

function jwms_get_jenkins_crumb {
  _checkRequireFields "$JWMS_JENKINS_USERNAME" "jenkins username" && return 1
  _checkRequireFields "$JWMS_JENKINS_API_TOKEN" "jenkins api token" && return 1
  _checkRequireFields "$JWMS_JENKINS_HOSTNAME" "jenkins hostname" && return 1

  CRUMB=$($CURL -s --user $JWMS_JENKINS_USERNAME:$JWMS_JENKINS_API_TOKEN $JWMS_JENKINS_HOSTNAME/crumbIssuer/api/xml?xpath=concat\(//crumbRequestField,%22:%22,//crumb\))
  echo $CRUMB
}

function jwms_str_to_hex {
  l_string=${1:-}
  echo -e "$l_string" | $HEXDUMP -v -e '1/1 "%02x"'
}
