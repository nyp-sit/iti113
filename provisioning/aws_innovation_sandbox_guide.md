Follow the guide on https://docs.aws.amazon.com/solutions/latest/innovation-sandbox-on-aws/solution-overview.html

Specific things to note (lessons learnt): 

1.  In the AccountPool stack, make sure to include us-east-1 as one of the regions, as some operations requires global access which needs us-east-1 region
2.  Make sure the corresponding AWS access portal URL and the IAM Identity Center metadata matches.. both needs to be from the ip stack.  Choose IPv4 only, for example, when updating the values in the AppConfig.

3. 
