package com.ruoyi.air.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.common.annotation.Excel;
import jdk.nashorn.internal.ir.annotations.Ignore;
import lombok.Data;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.TableId;
import com.ruoyi.common.core.domain.BaseEntity;

import java.util.Date;

/**
 * 空气质量数据对象 air_data
 *
 * @author ruoyi
 * @date 2023-10-28
 */
@Data
@TableName("air_data")
public class AirData {

    private static final long serialVersionUID = 1L;

    /**
     * 省
     */
    @Excel(name = "省")
    private String province;

    /**
     * 市
     */
    @Excel(name = "市")
    private String city;

    /**
     * 监测点
     */
    @Excel(name = "监测点")
    private String point;

    /**
     * AQI指数
     */
    @Excel(name = "AQI指数")
    private Double aqi;

    /**
     * 空气质量状况
     */
    @Excel(name = "空气质量状况")
    private String quality;

    /**
     * PM2.5
     */
    @Excel(name = "PM2.5")
    private Double pm25;

    /**
     * PM10
     */
    @Excel(name = "PM10")
    private Double pm10;

    /**
     * Co
     */
    @Excel(name = "Co")
    private Double co;

    /**
     * No2
     */
    @Excel(name = "No2")
    private Double no2;

    /**
     * So2
     */
    @Excel(name = "So2")
    private Double so2;

    /**
     * O3
     */
    @Excel(name = "O3")
    private Double o3;

    /**
     * 更新时间
     * */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date updateTime;

    /**
     * 数据更新时间段
     */
    @Excel(name = "数据更新时间段")
    private String updateSlot;

    /**
     * $column.columnComment
     */
    @TableId(type = IdType.AUTO)
    private Long id;

    /**
     * 是否是市总体数据
     */
    private int cityFlag;

}
