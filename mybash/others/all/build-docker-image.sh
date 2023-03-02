# ===== Might not be useful for CICD tools
CURRENT_DIR=$(pwd)
TEMP_DIR=$(mktemp -d)
cd ${TEMP_DIR}
echo $TEMP_DIR
# ======

PROJECT_NAME="budget_allocation"
SOURCE_REPO="ssh://git.r-local.net:7999/plt/budget_allocation.git"
DOCKER_REGISTRY="docker-regi.intra.zzz-it.com"
IMAGE_REPO="budgetallocation/budget_allocation"

BUILD_TAG=$1
IMAGE_NAME="${DOCKER_REGISTRY}/${IMAGE_REPO}:${BUILD_TAG}"

{
    echo "Building image with version ${IMAGE_NAME}" && \
    git clone ${SOURCE_REPO} && \
    cd ${PROJECT_NAME} && \
    git checkout ${BUILD_TAG}  && \
    docker build --tag ${IMAGE_NAME} . && \
    docker push ${IMAGE_NAME} && \
    echo "Build finished: ${IMAGE_NAME}"
} || {
    echo "Build failed"
}

# ===== Might not be useful for CICD tools
cd ${CURRENT_DIR}
rm -rf ${TEMP_DIR}
# ======
