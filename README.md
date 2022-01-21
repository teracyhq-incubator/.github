# .github

github actions repository to share reusable actions and workflows


## Actions

The composite github actions are organized with its versioning on its path
(\<action-name>-\<action-version>).

### docker-multiple-login

Login to multiple docker registries

- Example usage:

```yaml
- name: Login to Docker registries
  if: github.event_name != 'pull_request' && env.DOCKER_BUILD_ENABLED == 'true' && env.DOCKER_PUSH_ENABLED == 'true'
  uses: teracyhq-incubator/.github/actions/docker-multiple-login-develop@main
  with:
    github-token: ${{ secrets.GITHUB_TOKEN }}
    dockerhub-username: ${{ secrets.DOCKERHUB_USERNAME }}
    dockerhub-token: ${{ secrets.DOCKERHUB_TOKEN }}
```

- Options:

See the docker-multiple-login-\<version>/action.yaml file.

### docker-build-push-sign

Build, push and sign the built docker images, requires `docker-multiple-login` action for pushing.

- Example usage:

```yaml
- name: Build, push and sign Docker image
  uses: teracyhq-incubator/.github/actions/docker-build-push-sign-develop@main
  with:
    meta-images: docker.io/<user>/<repo>
    build-enabled: ${{ env.DOCKER_BUILD_ENABLED }}
    push-enabled: ${{ github.event_name != 'pull_request' && env.DOCKER_PUSH_ENABLED == 'true' }}
    cosign-key-base64: ${{ secrets.COSIGN_KEY_BASE64 }}
    cosign-password: ${{ secrets.COSIGN_PASSWORD }}
```

- Options:

See the docker-build-push-sign-\<version>/action.yaml file.
