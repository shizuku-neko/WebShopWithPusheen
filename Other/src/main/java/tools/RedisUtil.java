package tools;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;

import java.io.IOException;
import java.util.Properties;

public class RedisUtil {
    private static JedisPool pool = null;

    static {
        // 创建一个redis的连接池
        Properties prop = new Properties();
        try {
            prop.load(RedisUtil.class.getClassLoader().getResourceAsStream("redis.properties"));
        } catch (IOException e) {
            e.printStackTrace();
        }
        JedisPoolConfig poolConfig = new JedisPoolConfig();
        int maxIdle = new Integer(prop.getProperty("redis.maxIdle"));
        int minIdle = new Integer(prop.getProperty("redis.minIdle"));
        int maxTotal = new Integer(prop.getProperty("redis.maxTotal"));
        poolConfig.setMaxIdle(maxIdle);// 最大闲置个数
        poolConfig.setMinIdle(minIdle);// 最小闲置个数
        poolConfig.setMaxTotal(maxTotal);// 最大连接数
        String host = prop.getProperty("redis.host");
        int port = new Integer(prop.getProperty("redis.port"));
        pool = new JedisPool(poolConfig, host, port);
    }

    public static Jedis getJedis() {
        return pool.getResource();
    }
}