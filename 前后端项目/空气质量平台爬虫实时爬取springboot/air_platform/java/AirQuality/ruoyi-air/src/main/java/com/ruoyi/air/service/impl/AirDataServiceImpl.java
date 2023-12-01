package com.ruoyi.air.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.air.domain.AirData;
import com.ruoyi.air.domain.PointQualityDto;
import com.ruoyi.air.domain.vo.CityDataVo;
import com.ruoyi.air.domain.vo.PointQualityVo;
import com.ruoyi.air.mapper.AirDataMapper;
import com.ruoyi.air.service.IAirDataService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * 空气质量数据Service业务层处理
 *
 * @author ruoyi
 * @date 2023-10-28
 */
@Service
public class AirDataServiceImpl extends ServiceImpl<AirDataMapper, AirData> implements IAirDataService {
    @Autowired
    private AirDataMapper airDataMapper;

    /**
     * 查询空气质量数据
     *
     * @param id 空气质量数据主键
     * @return 空气质量数据
     */
    @Override
    public AirData selectAirDataById(Long id) {
        return airDataMapper.selectAirDataById(id);
    }

    /**
     * 查询空气质量数据列表
     *
     * @param airData 空气质量数据
     * @return 空气质量数据
     */
    @Override
    public List<AirData> selectAirDataList(AirData airData) {
        return airDataMapper.selectAirDataList(airData);
    }

    /**
     * 新增空气质量数据
     *
     * @param airData 空气质量数据
     * @return 结果
     */
    @Override
    public int insertAirData(AirData airData) {
        return airDataMapper.insertAirData(airData);
    }

    /**
     * 修改空气质量数据
     *
     * @param airData 空气质量数据
     * @return 结果
     */
    @Override
    public int updateAirData(AirData airData) {
        // airData.setUpdateTime(DateUtils.getNowDate());
        return airDataMapper.updateAirData(airData);
    }

    /**
     * 批量删除空气质量数据
     *
     * @param ids 需要删除的空气质量数据主键
     * @return 结果
     */
    @Override
    public int deleteAirDataByIds(Long[] ids) {
        return airDataMapper.deleteAirDataByIds(ids);
    }

    /**
     * 删除空气质量数据信息
     *
     * @param id 空气质量数据主键
     * @return 结果
     */
    @Override
    public int deleteAirDataById(Long id) {
        return airDataMapper.deleteAirDataById(id);
    }

    /**
     * 获取城市最新空气数据
     *
     * @param provinceName 省名称
     * @return 结果
     */
    @Override
    public List<CityDataVo> getCityDataByProvinceName(String provinceName) {
        List<AirData> airDataList = airDataMapper.getCityDataByName(provinceName);
        List<CityDataVo> res = new ArrayList<>();
        for (AirData airData : airDataList) {
            CityDataVo cityDataVo = new CityDataVo();
            List<Double> data = new ArrayList<>();
            data.add(airData.getAqi());
            data.add(airData.getPm25());
            data.add(airData.getPm10());
            data.add(airData.getCo());
            data.add(airData.getNo2());
            data.add(airData.getSo2());
            data.add(airData.getO3());
            cityDataVo.setData(data);
            cityDataVo.setCityName(airData.getPoint());
            cityDataVo.setNewestTime(airData.getUpdateTime());
            res.add(cityDataVo);
        }
        return res;
    }

    @Override
    public List<Map<String, Integer>> getCityQualityByProvinceName(String provinceName) {
        List<Map<String, Integer>> cityNameToCountList = airDataMapper.getCityQualityByProvinceName(provinceName);
        return cityNameToCountList;
    }

    @Override
    public List<PointQualityVo> getPointQualityByProvinceName(String provinceName) {
        List<PointQualityDto> list = airDataMapper.getPointQualityByProvinceName(provinceName);
        Map<String, List<PointQualityDto>> map = list.stream().collect(Collectors.groupingBy(PointQualityDto::getCity));
        List<PointQualityVo> res = new ArrayList<>();
        map.keySet().forEach(city -> {
            PointQualityVo pointQualityVo = new PointQualityVo();
            pointQualityVo.setCity(city);
            List<Map<String, String>> mapList = new ArrayList<>();
            map.get(city).forEach(i -> {
                Map<String, String> nameToValueMap = new HashMap<>();
                nameToValueMap.put("name", i.getName());
                nameToValueMap.put("value", i.getValue());
                mapList.add(nameToValueMap);
            });
            pointQualityVo.setData(mapList);
            res.add(pointQualityVo);
        });
        return res;
    }
}