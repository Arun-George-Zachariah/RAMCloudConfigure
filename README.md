# RAMCloudConfigure

This repository is intended to aleviate the challenge of installing
RAMCloud, not that is difficult.
We included a list of scripts to configure a RAMCloud cluster using the
CloudLab distributed computing platform.

We have tested the folling scripts using an Intel architecture. Particularlly,
using the *Utah* Cluster, with *xl170* hardware. No further tests have been
conducted, but you are welcome to try it out. Unfortunatelly, our project does 
not configure infiniband networks. Instead, we opeted for a TCP interface.

## What it does
This repo configures:
* RAMCloud (latest version)
* Zookeeper (3.4.14)

To run it, just execute:
`./ramcloud-configure.sh cluster-machines.txt USER PRIVATE_KEY`

Where, cluster-machines.txt is a text file including the list of all hosts in the
Cloudlab cluster. The repository will configure the first machine as RAMCloud's 
coordinator, and the rest of the hosts in the list as servers.
USER is Cloudlab's registered user name. PRIVATE\_KEY is user's ssh private key. 

### Notes
The scripts in this repo assumes that,
* You are using a cluster in Cloudlab
* You have an authorized ssh-key registered in Cloudlab
* You execute the ClusterConfigure repo beforehand

### Special thanks to
* <a href="https://github.com/anask">Anaks Katib</a>, he's the man

