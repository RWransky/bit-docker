# bit-docker
A general purpose Docker image for initializing or running bit workspaces.

## General Info
`bit-docker` establishes a stable, reusable Dockerized solution for spinning up new and existing bit workspaces!

Core technologies:
- Node 16.x
- bvm
- npm or yarn

## About Bit
Please refer to [bit.dev](https://bit.dev) for a detailed explanation.

# Required Environment Variables
`bit-docker` supports the following environment variables at container run time. *Please note* these are ALL required to run `bit-docker` successfully.

- `BIT_ORG`: Your organization's name (or your personal account username) on [bit.cloud](https://bit.cloud).
- `WORKSPACE_DIRECTORY`: The directory name for your workspace (note if you are using a pre-existing workspace you MUST match your existing workspace directory name).
- `WORKSPACE_TEMPLATE`: Pick an available bit workspace template (e.g. `react`). For a full list of available templates see section below.
- `DEFAULT_SCOPE`: Name of your default scope. Scope's in bit act like the overall project name where further organization of components than fall under.
- `INIT_WORKSPACE`: Boolean (true/false) value to tell the init script whether you are wanting to create a new workspace or if you are using an existing one.
- `REPORT_ANALYTICS`: Boolean (true/false) value bit configuration to automatically agree to send analytics reports to bit.
- `REPORT_ERRORS`: Boolean (true/false) value bit configuriation to automatically agree to send error reports to bit.
- `NO_WARNINGS`: Boolean (true/false) value bit configuration to suppress warning messages in your console.

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

# Use
## Building/Pulling Image
From the base Dockerfile: `docker build -t bit --platform linux/x86_64 .`
From Docker Hub: `docker pull rwransky/bit-docker:latest`

## Initializing New Workspace
Replace appropriate environment variables as necessary:

`docker run -it -e "BIT_ORG=org_name" -e  "WORKSPACE_DIRECTORY=workspace_name" -e "WORKSPACE_TEMPLATE=react" -e "DEFAULT_SCOPE=scope_name" -e  "INIT_WORKSPACE=true" -e "REPORT_ANALYTICS=false" -e "REPORT_ERRORS=false" -e "NO_WARNINGS=true" rwransky/bit-docker`

Now you are set to add new bit components! See [here](https://bit.dev/docs/getting-started/composing/creating-components) for help getting started!

### **IMPORTANT NOTE**
Be sure to commit your workspace to a remote repository prior to exiting the above container. This is the easiest way to save the workspace for future use. `git` has been preinstalled in the image for this purpose.

## Running an Existing Workspace (Docker Compose)
`bit-docker` is also great for containerizing your existing bit workspaces! Simply pass `false` to `INIT_WORKSPACE` to tell the init script to bypass the `bit init` command.

Please refer to `docker-compose.yml` for an example on how to mount an existing workspace, configuring the environment variables, and exposing a port to be able to see the bit component interface.

This example docker compose file uses a sample workspace under `workspace_example`. This directory contains a sample `workspace.jsonc` file that bit creates after initializing a workspace.

To run the example:

`docker compose run --rm --service-ports bit`

`bit start`

Visit `localhost:3000` :sparkles:

# Collaboration
Pull requests are welcome! This is my first truly open source project that I hope will be used widely by the bit community. Please be kind as I learn the ropes!

~Rem :heart:
