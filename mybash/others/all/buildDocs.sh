

#!/bin/bash
set -x
################################################################################
# File:    buildDocs.sh
# Purpose: Script that builds our documentation using sphinx and updates GitHub
#          Pages. This script is executed by:
#            .github/workflows/docs_pages_workflow.yml
#
# Authors: Michael Altfield <michael@michaelaltfield.net>
# Created: 2020-07-17
# Updated: 2020-07-20
# Version: 0.2
################################################################################
 
###################
# INSTALL DEPENDS #
###################
 
apt-get update
apt-get -y install git rsync 
# apt-get python3-sphinx python3-sphinx-rtd-theme python3-stemmer python3-git python3-pip python3-virtualenv python3-setuptools
# python3 -m pip install --upgrade rinohtype pygments
 
#####################
# DECLARE VARIABLES #
#####################
 
pwd
ls -lah
export SOURCE_DATE_EPOCH=$(git log -1 --pretty=%ct)
 
# make a new temp dir which will be our GitHub Pages docroot
docroot=`mktemp -d`

export REPO_NAME="${GITHUB_REPOSITORY##*/}"
 
##############
# BUILD DOCS #
##############
 
# first, cleanup any old builds' static assets
make -C docs clean
 
# get a list of branches, excluding 'HEAD' and 'gh-pages'
versions="`git for-each-ref '--format=%(refname:lstrip=-1)' refs/remotes/origin/ | grep -viE '^(HEAD|gh-pages)$'`"
for current_version in ${versions}; do
 
   # make the current language available to conf.py
   export current_version
   git checkout ${current_version}
 
   echo "INFO: Building sites for ${current_version}"
 
   # skip this branch if it doesn't have our docs dir & sphinx config
   if [ ! -e 'docs_ghpage/conf.py' ]; then
      echo -e "\tINFO: Couldn't find 'docs_ghpage/conf.py' (skipped)"
      continue
   fi

   #### Install a2
   # pip install -e .


 
   # languages="en `find docs_ghpage/locales/ -mindepth 1 -maxdepth 1 -type d -exec basename '{}' \;`"
   languages="en"

   for current_language in ${languages}; do
 
      # make the current language available to conf.py
      export current_language
 
      ##########
      # BUILDS #
      ##########
      echo "INFO: Building for ${current_language}"
 

# Running Sphinx v4.4.0
# Configuration error:
# config directory doesn't contain a conf.py file (/__w/myutil/myutil/a2)
# + rsync -av docs_ghpage/_build/html/ /tmp/tmp.EHpPcy6lE3/
# rsync: change_dir "/__w/myutil/myutil//docs_ghpage/_build/html" failed: No such file or directory (2)
# sending incremental file list
# rsync error: some files/attrs were not transferred (see previous errors) (code 23) at main.c(1207) [sender=3.1.3]

      # Generate the RST
      #sphinx-apidoc -f -o docs_ghpage/_build/rst/${current_language}/${current_version}/   a2/
      sphinx-apidoc -f -d 20   -o     docs_ghpage/     a2/    *zz*


      # Generate HTML  from RST
      sphinx-build -b html    docs_ghpage/     docs_ghpage/_build/html/${current_language}/${current_version} -D language="${current_language}"
 

      # PDF #
      # sphinx-build -b rinoh a2/ docs_ghpage/_build/rinoh -D language="${current_language}"
      # mkdir -p "${docroot}/${current_language}/${current_version}"
      # cp "docs_ghpage/_build/rinoh/target.pdf" "${docroot}/${current_language}/${current_version}/helloWorld-docs_${current_language}_${current_version}.pdf"
 
      # EPUB #
      # sphinx-build -b epub a2/ docs_ghpage/_build/epub -D language="${current_language}"
      # mkdir -p "${docroot}/${current_language}/${current_version}"
      # cp "docs_ghpage/_build/epub/target.epub" "${docroot}/${current_language}/${current_version}/helloWorld-docs_${current_language}_${current_version}.epub"
 
      # copy the static assets produced by the above build into our docroot
      rsync -av "docs_ghpage/_build/html/" "${docroot}/"
 
   done
 
done
 
# return to master branch
#git checkout master
 
#######################
# Update GitHub Pages #
#######################
 
git config --global user.name "${GITHUB_ACTOR}"
git config --global user.email "${GITHUB_ACTOR}@users.noreply.github.com"
 
pushd "${docroot}"
 
# don't bother maintaining history; just generate fresh
git init
git remote add deploy "https://token:${GITHUB_TOKEN}@github.com/${GITHUB_REPOSITORY}.git"
git checkout -b gh-pages
 
# add .nojekyll to the root so that github won't 404 on content added to dirs
# that start with an underscore (_), such as our "_content" dir..
touch .nojekyll
 
# add redirect from the docroot to our default docs language/version
cat > index.html <<EOF
<!DOCTYPE html>
<html>
   <head>
      <title>helloWorld Docs</title>
      <meta http-equiv = "refresh" content="0; url='/${REPO_NAME}/en/main/'" />
   </head>
   <body>
      <p>Please wait while you're redirected to our <a href="/${REPO_NAME}/en/main/">documentation</a>.</p>
   </body>
</html>
EOF
 
# Add README
cat > README.md <<EOF
# GitHub Pages Cache
 
Nothing to see here. The contents of this branch are essentially a cache that's not intended to be viewed on github.com.
 
 
If you're looking to update our documentation, check the relevant development branch's 'docs_ghpage/' dir.
 
For more information on how this documentation is built using Sphinx, Read the Docs, and GitHub Actions/Pages, see:
 
 * https://tech.michaelaltfield.net/2020/07/18/sphinx-rtd-github-pages-1
EOF
 
# copy the resulting html pages built from sphinx above to our new git repo
git add .
 
# commit all the new files
msg="Updating Docs for commit ${GITHUB_SHA} made on `date -d"@${SOURCE_DATE_EPOCH}" --iso-8601=seconds` from ${GITHUB_REF} by ${GITHUB_ACTOR}"
git commit -am "${msg}"
 
# overwrite the contents of the gh-pages branch on our github.com repo
git push deploy gh-pages --force
 
popd # return to main repo sandbox root
 
# exit cleanly
exit 0






# sphinx-apidoc¶
# Synopsis
# sphinx-apidoc [OPTIONS] -o <OUTPUT_PATH> <MODULE_PATH> [EXCLUDE_PATTERN …]

# Description
# sphinx-apidoc is a tool for automatic generation of Sphinx sources that, using the autodoc extension, document a whole package in the style of other automatic API documentation tools.

# MODULE_PATH is the path to a Python package to document, and OUTPUT_PATH is the directory where the generated sources are placed. Any EXCLUDE_PATTERNs given are fnmatch-style file and/or directory patterns that will be excluded from generation.

# Warning

# sphinx-apidoc generates source files that use sphinx.ext.autodoc to document all found modules. If any modules have side effects on import, these will be executed by autodoc when sphinx-build is run.

# If you document scripts (as opposed to library modules), make sure their main routine is protected by a if __name__ == '__main__' condition.

# Options
# -o <OUTPUT_PATH>
# Directory to place the output files. If it does not exist, it is created.

# -q
# Do not output anything on standard output, only write warnings and errors to standard error.

# -f, --force
# Force overwriting of any existing generated files.

# -l, --follow-links
# Follow symbolic links.

# -n, --dry-run
# Do not create any files.

# -s <suffix>
# Suffix for the source files generated. Defaults to rst.

# -d <MAXDEPTH>
# Maximum depth for the generated table of contents file.

# --tocfile
# Filename for a table of contents file. Defaults to modules.

# -T, --no-toc
# Do not create a table of contents file. Ignored when --full is provided.

# -F, --full
# Generate a full Sphinx project (conf.py, Makefile etc.) using the same mechanism as sphinx-quickstart.

# -e, --separate
# Put documentation for each module on its own page.

# New in version 1.2.

# -E, --no-headings
# Do not create headings for the modules/packages. This is useful, for example, when docstrings already contain headings.

# -P, --private
# Include “_private” modules.

# New in version 1.2.

# --implicit-namespaces
# By default sphinx-apidoc processes sys.path searching for modules only. Python 3.3 introduced PEP 420 implicit namespaces that allow module path structures such as foo/bar/module.py or foo/bar/baz/__init__.py (notice that bar and foo are namespaces, not modules).

# Interpret paths recursively according to PEP-0420.

# -M, --module-first
# Put module documentation before submodule documentation.

# These options are used when --full is specified:

# -a
# Append module_path to sys.path.

# -H <project>
# Sets the project name to put in generated files (see project).

# -A <author>
# Sets the author name(s) to put in generated files (see copyright).

# -V <version>
# Sets the project version to put in generated files (see version).

# -R <release>
# Sets the project release to put in generated files (see release).

# Project templating

# New in version 2.2: Project templating options for sphinx-apidoc

# -t, --templatedir=TEMPLATEDIR
# Template directory for template files. You can modify the templates of sphinx project files generated by apidoc. Following Jinja2 template files are allowed:

# module.rst_t

# package.rst_t

# toc.rst_t

# root_doc.rst_t

# conf.py_t

# Makefile_t

# Makefile.new_t

# make.bat_t

# make.bat.new_t

# In detail, please refer the system template files Sphinx provides. (sphinx/templates/apidoc and sphinx/templates/quickstart)

# Environment
# SPHINX_APIDOC_OPTIONS
# A comma-separated list of option to append to generated automodule directives. Defaults to members,undoc-members,show-inheritance.

# See also