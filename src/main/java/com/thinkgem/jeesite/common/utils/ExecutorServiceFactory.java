package com.thinkgem.jeesite.common.utils;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

public class ExecutorServiceFactory {

    private int corePoolSize = 10;
    private int maximumPoolSize = 20;
    private Long keepAliveTime = 1000L;

    private static ExecutorServiceFactory executorFactory = new ExecutorServiceFactory();


    /**
     * 定时任务线程池
     */
    private ExecutorService executorService;

    private ExecutorServiceFactory() {
    }

    /**
     * 获取ExecutorServiceFactory
     *
     * @return
     */
    public static ExecutorServiceFactory getInstance() {
        return executorFactory;
    }


    public ExecutorService getThreadPool() {
        if (this.executorService == null) {
            this.executorService = new ThreadPoolExecutor(this.corePoolSize, this.maximumPoolSize, this.keepAliveTime.longValue(), TimeUnit.MILLISECONDS, new LinkedBlockingQueue());
        }

        return this.executorService;
    }

    public int getCorePoolSize() {
        return this.corePoolSize;
    }

    public void setCorePoolSize(int corePoolSize) {
        this.corePoolSize = corePoolSize;
    }

    public int getMaximumPoolSize() {
        return this.maximumPoolSize;
    }

    public void setMaximumPoolSize(int maximumPoolSize) {
        this.maximumPoolSize = maximumPoolSize;
    }

    public Long getKeepAliveTime() {
        return this.keepAliveTime;
    }

    public void setKeepAliveTime(Long keepAliveTime) {
        this.keepAliveTime = keepAliveTime;
    }


}
