# bvm supports Node version 16.x
FROM node:16

# Set ARG values to ENV values for init script
ENV BIT_ORG=
ENV WORKSPACE_DIRECTORY=
ENV WORKSPACE_TEMPLATE=
ENV DEFAULT_SCOPE=
ENV INIT_WORKSPACE=
ENV REPORT_ANALYTICS=false
ENV REPORT_ERRORS=false
ENV NO_WARNINGS=true

# Set PATH global variable
ENV PATH=$HOME/bin:$PATH

# Install general tools
RUN apt-get update -y && apt-get install -y git vim dos2unix

# Change working directory to /tmp
WORKDIR /tmp

# Install bvm globally
RUN npm i -g @teambit/bvm

# Install bit
RUN bvm install

# Add init.sh and give executable permissions
ADD init.sh .
RUN chmod +x init.sh
RUN dos2unix init.sh

ENTRYPOINT ["sh","-c","/tmp/init.sh"]

CMD ["-bit_org", $BIT_ORG, "-workspace_directory", $WORKSPACE_DIRECTORY, "-workspace_template", $WORKSPACE_TEMPLATE, "-default_scope", $DEFAULT_SCOPE, "-init_workspace", $INIT_WORKSPACE, "-report_analytics", $REPORT_ANALYTICS, "-report_errors", $REPORT_ERRORS, "-no_warnings", $NO_WARNINGS]