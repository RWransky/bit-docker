# bit-docker
A general purpose docker image for initializing or running bit workspaces.

# Use
`docker build -t bit .`

`docker run -it -e "BIT_ORG=org_name" -e  "WORKSPACE_DIRECTORY=workspace_name" -e "WORKSPACE_TEMPLATE=react" -e "DEFAULT_SCOPE=scope_name" -e  "INIT_WORKSPACE=true" -e "REPORT_ANALYTICS=false" -e "REPORT_ERRORS=false" -e "NO_WARNINGS=true" bit`

## Docker Compose Example
`docker compose run --rm --service-ports bit`

### Available Templates
Currently supported bit templates (updated September 2022):
```
teambit.generator/generator
    component-generator (create your own component generator
Docs: https://bit.dev/docs/dev-services-overview/generator/generate-component)
    workspace-generator (create your own workspace generator -
Docs: https://bit.dev/docs/dev-services-overview/generator/generate-workspace)

teambit.pipelines/builder
    build-task (create a custom build task for your component pipelines)

teambit.react/react
    react (a basic react component)
    react-context (a react context component)
    react-hook (a react hook component)
    react-js (a basic react component in js)
    react-env (customize the base React env with your configs and tools)

teambit.harmony/aspect
    aspect (extend Bit capabilities)

teambit.html/html
    html-env (customize the base Html env with your configs and tools)
    html (a basic html component)

teambit.harmony/node
    node-env (customize the base Node env with your configs and tools)
    node (a Node.js module)
    express-app (a bit express application)
    express-route (an express route)

teambit.react/react-native
    react-native-env (customize the base React Native env with your configs and tools)
    react-native (a basic react native component)

teambit.mdx/mdx
    mdx (MDX-file compiled by Bit to a reuseable component)
```