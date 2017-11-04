package com.burrsutter.myvertxdemo;

import io.vertx.core.AbstractVerticle;
import io.vertx.ext.web.Router;

public class Server extends AbstractVerticle {

  @Override
  public void start() {
    String hostname = System.getenv().getOrDefault("HOSTNAME", "unknown");
    long memory = Runtime.getRuntime().maxMemory();
    int cores = Runtime.getRuntime().availableProcessors();

    Router router = Router.router(vertx);
    router.get("/").handler(rc -> {
      rc.response().end(
        "Bonjour Vert.x on " + hostname + " " + new java.util.Date()
        + " Memory: " + (memory / 1024 / 1024) 
        + " Cores: " + cores
      );
    });

    router.get("/memory").handler( rc -> {
      System.out.println("Starting to allocate memory...");
      Runtime rt = Runtime.getRuntime();
      StringBuilder sb = new StringBuilder();
      long maxMemory = rt.maxMemory();
      long usedMemory = 0;
      while (((float) usedMemory / maxMemory) < 0.80) {
        sb.append(System.nanoTime() + sb.toString());
        usedMemory = rt.totalMemory();
      }
      String msg = "Allocated more than 80% (" + humanReadableByteCount(usedMemory, false) + ") of the max allowed JVM memory size ("
          + humanReadableByteCount(maxMemory, false) + ")";
      System.out.println(msg);
      // return msg;
      rc.response().end(msg + "<hr>" + sb.toString()); 
    });

    vertx.createHttpServer()
        .requestHandler(router::accept)
        .listen(8080);
  }

  public static String humanReadableByteCount(long bytes, boolean si) {
		int unit = si ? 1000 : 1024;
		if (bytes < unit)
			return bytes + " B";
		int exp = (int) (Math.log(bytes) / Math.log(unit));
		String pre = (si ? "kMGTPE" : "KMGTPE").charAt(exp - 1) + (si ? "" : "i");
		return String.format("%.1f %sB", bytes / Math.pow(unit, exp), pre);
	}

}
