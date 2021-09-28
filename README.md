# BasicDemo
Contain basic functionalities to demonstrate the Salesforce platform

Steps to use the package in a developer org.
1. Sign up for a developer org: https://developer.salesforce.com/signup
2. Install the Salesforce CLI (https://developer.salesforce.com/tools/sfdxcli)
3. Open Commadn Promp or Powershell
4. Authorize your developer org: sfdx force:auth:web:login -r http://login.salesforce.com -a MyDevHub
5. Login and allow the connected app in the browser (then you can close)
6. Download this package, and navigate there in the Comand Prompt
7. Deploy the package: sfdx force:source:deploy -u MyDevHub -p force-app

Steps to use the package in a scracth org. (More on scratch orgs: https://developer.salesforce.com/docs/atlas.en-us.232.0.sfdx_dev.meta/sfdx_dev/sfdx_dev_scratch_orgs.htm)
1. Open Commadn Promp or Powershell
2. Navigate to the package folder
3. Create a scratch org based on the developer org: sfdx force:org:create -a MyScratchOrg -v MyDevHub -d 30 -f config\project-scratch-def.json
4. Push the package: sfdx force:source:push -u MyScratchOrg
