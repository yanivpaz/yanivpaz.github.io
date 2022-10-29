```
aws cloudformation get-template --stack-name ${stack}  \
--template-stage Original --output text \
| grep -v STAGESAVAILABLE  > ${stack}.template.yaml

aws cloudformation describe-stacks --stack-name ${stack} \
|  jq .Stacks[].Parameters >  ${stack}.params.json

aws cloudformation estimate-template-cost \
--template-body file://${stack}.template.yaml \
--parameters file://${stack}.params.json \
--output text
```
