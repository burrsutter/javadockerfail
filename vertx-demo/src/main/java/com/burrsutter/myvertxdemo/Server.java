package com.burrsutter.myvertxdemo;

import io.vertx.core.AbstractVerticle;

public class Server extends AbstractVerticle {

  @Override
  public void start() {
    String hostname = System.getenv().getOrDefault("HOSTNAME", "unknown");
    long memory = Runtime.getRuntime().maxMemory();
    int cores = Runtime.getRuntime().availableProcessors();
    vertx.createHttpServer()
        .requestHandler(req -> req.response().end(
          "Bonjour Vert.x on " + hostname + " " + new java.util.Date()
          + " Memory: " + (memory / 1024 / 1024) 
          + " Cores: " + cores
        ))
        .listen(8080);
  }

}
