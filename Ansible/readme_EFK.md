Elasticsearch Filebeat Kibana 
Docker logging
1)Install and run Elasticserch and Kibana(with nginx)
Elasticsearch(development and production mode)

     ElasticSearch

This for using elasticsearch in production
     
grep vm.max_map_count /etc/sysctl.conf
vm.max_map_count=262144
sysctl -w vm.max_map_count=262144
If you are bind-mounting a local directory or file, it must be readable by the elasticsearch user.
In addition, this user must have write access to the data and log dirs.
A good strategy is to grant group access to gid 1000 or 0 for the local directory.
docker run --rm centos:7 /bin/bash -c 'ulimit -Hn && ulimit -Sn && ulimit -Hu && ulimit -Su'
sudo swapoff -a

This for single-node mode

Single-node discovery

We recognize that some users need to bind transport to an external interface for testing their usage of the transport client.
For this situation, we provide the discovery type single-node (configure it by setting discovery.type to single-node);
in this situation, a node will elect itself master and will not join a cluster with any other node.

es.enforce.bootstrap.checks to true - ? 

-e "discovery.type=single-node"
a)
network.host: <PRIVATE IP OF HOST>
discovery.type: single-node

b)
cluster.name: channa_dev_machine # give a specific name for your
cluster node.local: true # disable network

or (Some part of config file)
 cluster.name: "docker-cluster"
 network.host: 0.0.0.0
 
 # minimum_master_nodes need to be explicitly set when bound on a public IP
 # set to 1 to allow single node clusters
 discovery.zen.minimum_master_nodes: 1

      Kibana + nginx
      
2)Install and run Filebeat
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

Some information about Kibana

Create index patterns

1)Elasticsearch creates indexes on the data that it stores. Before you can view logs in Kibana, 
you must define index patterns that match the index names of your log data in Elasticsearch.
To see a list of all Elasticsearch indexes, click Management in the Kibana web application's left pane and then Index Management.


Because your log data is sent by Filebeat, Elasticsearch creates index names with the pattern filebeat-<filebeat_version>-<date>

Depending on your needs, you may want to create multiple index patterns. For example, filebeat-* would fetch all Filebeat-based indexes, while filebeat-6.4.0-2018.08-* would fetch all Filebeat-based indexes created in the month of August, 2018Depending on your needs, you may want to create multiple index patterns. For example, 
filebeat-* would fetch all Filebeat-based indexes, while filebeat-6.4.0-2018.08-* would fetch all Filebeat-based indexes created in the month of August, 2018

2)Kibana - Index pattern - Create index pattern (for example filebeat-*)- Time Filter (choossing @timestamp) - create index pattern
3)The Discover, Visualize, Dashboard, and Timelion features in the left pane enable you to view and analyze your log data in different ways.

These settings could be enough but the configuration can really be improved by using two processors.
These processors alter the logs to enhance their visualization in Kibana.

Another important thing to note is that other than application generated logs, we also need metadata associated with the containers, 
such as container name, image, tags, host etc… This will allow us to specifically identify the exact host and container the logs are generating.
These data can also be sent easily by Filebeat along with the application log entries.

The first one is add_docker_metadata.
The second one is decode_json_fields.


