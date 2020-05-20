# Roles
FROM apple:latest as developer

RUN  curl get https://requirements.txt  && \
     web_development.sh && \
     application_setup_on_aws && \
     maitain_and_publish_ng_library
ADD  documentation.md .

FROM barclays:2010.2018 as lead
RUN  curl get https://requirements.txt  && \
     architect_and_lead_team.sh && \
     micro_services_dev.sh && \
     web_development.sh && \
     devops_ci_cd.sh 
     
FROM verizon:2005:2009 as sr_dev

RUN  make wire_frames  && \
     web_development.sh && \
ADD  documentation.md .

CMD["npm","run","dev"]