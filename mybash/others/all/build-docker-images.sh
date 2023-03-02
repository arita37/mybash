


export BASE_VERSION='1.1.2'    #### Gluster
export PYTHON_VERSION='3.6.7' #### Python
export HADOOP_CLIENT_TAG='www1-c6000-pro-2022.01.14'
export HADOOP_DIR='/usr/local/hdp314'
export SPARK_VERSION='2.4.7'
export VERSION='1.0.0'
export REQUIREMENT_FILE='requirements.txt'


function build {
      # ===== Might not be useful for CICD tools
      CURRENT_DIR=$(pwd)
      TEMP_DIR=$(mktemp -d)
      cd ${TEMP_DIR}
      echo $TEMP_DIR
      # ======


      PROJECT_NAME="rpp-fraud"
      SOURCE_REPO="https://git.zzz-it.com/scm//aog-click-fraud.git"
      DOCKER_REGISTRY="docker-regi.intra.zzz-it.com"
      IMAGE_REPO="ppp/rpp-fraud"

      BUILD_TAG=$1
      IMAGE_TAG=$2
      DOCKERFILE=$3
      IMAGE_NAME="${DOCKER_REGISTRY}/${IMAGE_REPO}:${IMAGE_TAG}"


      {
          echo "Building image with version ${IMAGE_NAME}" && \
          # git clone ${SOURCE_REPO} && \
          # cd ${PROJECT_NAME} && \
          # git checkout ${BUILD_TAG}  && \
          docker build --tag ${IMAGE_NAME} -f ${DOCKERFILE}  . && \
          echo "Build finished: ${IMAGE_NAME}"
      } || {
          echo "Build failed"
      }

      # ===== Might not be useful for CICD tools
      cd ${CURRENT_DIR}
      rm -rf ${TEMP_DIR}
      # ======

}


