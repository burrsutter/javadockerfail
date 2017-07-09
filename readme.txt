cat << EOF > Test.java
public class Test {
  public static void main (String[] args) {
    System.out.println("Memory:" + Runtime.getRuntime().maxMemory()/1024/1024);
    System.out.println("CPUs: " + Runtime.getRuntime().availableProcessors());
  }
}
EOF

Docker Tests
# Java 8u121 ignoring the memory constraint
docker run -m 100MB openjdk:8u121 java -XshowSettings:vm -version

# Java 8u131 calculating based on memory constraint
docker run -m 100MB openjdk:8u131 java -XX:+UnlockExperimentalVMOptions -XX:+UseCGroupMemoryLimitForHeap -XshowSettings:vm -version


java -XshowSettings:vm -XX:+UnlockDiagnosticVMOptions -XX:+PrintActiveCpus -version
java -XX:+PrintFlagsFinal -XX:+PrintGCDetails -version | grep 'MaxHeapSize'

docker run -it -m 500MB --cpus="1.25" openjdk:8u131

cat /sys/fs/cgroup/cpu/cpu.cfs_quota_us
cat /sys/fs/cgroup/cpu/cpu.cfs_period_us

java -XX:+UnlockDiagnosticVMOptions -XX:+PrintActiveCpus -version
cd test
java Test

now try with the experimental settings
java -XX:+UnlockExperimentalVMOptions -XX:+UseCGroupMemoryLimitForHeap Test

--------------------------------
Kubernetes is using the --cpu-quota and --cpu-period settings
you can try
docker run -it -m 500MB --cpu-quota=50000 --cpu-period=100000 openjdk:8u131 

Otherwise just follow steps 1 through 9 and if you wish to kill the JVM running Spring Boot
curl 192.168.99.101:31915/api/memory
as that will overallocate heap and depending on the VM RAM size and the bootboom-deployment.yaml, it dies