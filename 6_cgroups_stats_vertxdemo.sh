#!/bin/bash
POD=$(kubectl get pods -n javademo -l app=vertxdemo -o 'jsonpath={.items[0].metadata.name}')
echo $POD
command1="kubectl exec -it --namespace=javademo $POD cat /sys/fs/cgroup/memory/memory.limit_in_bytes"
echo $command1
POD_MEMORY=$($command1)
echo "Memory Limit: " $POD_MEMORY

echo ${POD_MEMORY//}/1024/1024|bc

command2="kubectl exec -it --namespace=javademo $POD cat /sys/fs/cgroup/cpu/cpu.cfs_quota_us"
echo $command2
POD_CPU_QUOTA=$($command2)
echo $POD_CPU_QUOTA

command3="kubectl exec -it --namespace=javademo $POD cat /sys/fs/cgroup/cpu/cpu.cfs_period_us"
echo $command3
POD_CPU_PERIOD=$($command3)
echo $POD_CPU_PERIOD

echo "scale=2; ${POD_CPU_QUOTA//}/${POD_CPU_PERIOD//}" | bc -l 

command4="kubectl exec -it --namespace=javademo $POD cat /sys/fs/cgroup/cpu/cpu.shares"
echo $command4
POD_CPU_SHARES=$($command4)
echo $POD_CPU_SHARES
