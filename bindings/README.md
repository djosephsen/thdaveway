#A simpler way to create bindings 

## the strategy:
run the provision_instance_eip.py script from the internal tools suite, and create an "IN" file that looks like:

```
10.92.56.164 34.213.84.60 outbound-84-60.usw2.aws.post.pinterest.com
10.92.33.32 35.161.220.8 outbound-220-8.usw2.aws.post.pinterest.com
10.92.58.160 35.162.39.219 outbound-39-219.usw2.aws.post.pinterest.com
10.92.83.118 35.165.43.56 outbound-43-56.usw2.aws.post.pinterest.com
```

Pipe that file to the various commands to generate proxy.json, ptr requests etc.. Every command returns either literal aws cli syntax you can vet and copy/paste or direct output of the format you need. (eg, none of these commands actually effects environmental change directly)
