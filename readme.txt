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
java -XX:+UnlockExperimentalVMOptions -XX:+UseCGroupMemoryLimitForHeap Test

--------------------------------

docker run -it -m 500MB --cpu-quota=50000 --cpu-period=100000 openjdk:8u131 
