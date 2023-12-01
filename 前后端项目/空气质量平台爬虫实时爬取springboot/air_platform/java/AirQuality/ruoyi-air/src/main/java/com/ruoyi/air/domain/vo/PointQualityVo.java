package com.ruoyi.air.domain.vo;

import lombok.Data;

import java.util.List;
import java.util.Map;

@Data
public class PointQualityVo {

    private String city;

    private List<Map<String, String>> data;
}
