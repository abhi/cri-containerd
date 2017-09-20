#!/bin/bash

crictl_cli(){
  local __cli_output=$2
  result="$(crictl --runtime-endpoint /var/run/cri-containerd.sock --image-endpoint --/var/run/cri-containerd.sock $1)"
  $__cli_output="${result}" 
}

crictl_stop_running_containers() {
   crictl_cli "ps" result 
   for x in $(awk "/$result/ "'{ print $1 }' | awk '{if(NR>1)print}') ;do    
       action = "stop"
       crictl_cli $action $x
   done
}

crictl_rm_stopped_containers() {
   action = "ps"
   crictl_cli "ps" result
   for x in $(awk "/$result/ "'{ print $1 }' | awk '{if(NR>1)print}') ;do
       action = "rm"
       crictl_cli $action $x
   done
}

crictl_stop_sandboxes() {
   crictl_cli "sandboxes" result
   for x in $(awk "/$result/ "'{ print $1 }' | awk '{if(NR>1)print}') ;do    
       action = "stops"
       crictl_cli $action $x
   done
}

crictl_rm_sandboxes() {
   crictl_cli "sandboxes" result
   for x in $(awk "/$result/ "'{ print $1 }' | awk '{if(NR>1)print}') ;do    
       action = "stops"
       crictl_cli $action $x
   done
}

crictl_rm_images() {
   crictl_cli "images" result
   for x in $(awk "/$result/ "'{ print $1 }' | awk '{if(NR>1)print}') ;do    
       action = "rmi"
       crictl_cli $action $x
   done
}
crictl_stop_running_containers
crictl_rm_stopped_containers
crictl_stop_sandboxes
crictl_rm_sandboxes
crictl_rm_images
