package com.ruoyi.air.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ruoyi.air.domain.AirData;
import com.ruoyi.air.domain.PointQualityDto;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

/**
 * 空气质量数据Mapper接口
 *
 * @author ruoyi
 * @date 2023-10-28
 */
public interface AirDataMapper extends BaseMapper<AirData> {
    /**
     * 查询空气质量数据
     *
     * @param id 空气质量数据主键
     * @return 空气质量数据
     */
    public AirData selectAirDataById(Long id);

    /**
     * 查询空气质量数据列表
     *
     * @param airData 空气质量数据
     * @return 空气质量数据集合
     */
    public List<AirData> selectAirDataList(AirData airData);

    /**
     * 新增空气质量数据
     *
     * @param airData 空气质量数据
     * @return 结果
     */
    public int insertAirData(AirData airData);

    /**
     * 修改空气质量数据
     *
     * @param airData 空气质量数据
     * @return 结果
     */
    public int updateAirData(AirData airData);

    /**
     * 删除空气质量数据
     *
     * @param id 空气质量数据主键
     * @return 结果
     */
    public int deleteAirDataById(Long id);

    /**
     * 批量删除空气质量数据
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteAirDataByIds(Long[] ids);


    @Select("SELECT id,province,city,point,aqi,quality,pm25,pm10,co,no2,so2,o3,a.update_time,update_slot,city_flag FROM air_data a,(\n" +
            "SELECT a2.update_time FROM air_data a2 WHERE a2.province=#{provinceName} AND a2.city_flag=1 GROUP BY a2.update_time ORDER BY a2.update_time DESC LIMIT 1) t WHERE a.province=#{provinceName} AND a.city_flag=1 AND a.update_time=t.update_time")
    List<AirData> getCityDataByName(String provinceName);

    @Select("SELECT quality AS name,count(quality) AS value FROM air_data a,(\n" +
            "SELECT a2.update_time FROM air_data a2 WHERE a2.province=#{provinceName} AND a2.city_flag=1 ORDER BY a2.update_time DESC LIMIT 1) t WHERE a.province=#{provinceName} AND a.city_flag=1 AND a.update_time=t.update_time GROUP BY a.quality")
    List<Map<String, Integer>> getCityQualityByProvinceName(String provinceName);

    @Select("SELECT a.city AS city,quality AS name,count(quality) AS value FROM air_data a,(\n" +
            "SELECT a2.update_time FROM air_data a2 WHERE a2.province=#{provinceName} AND a2.city_flag=1 ORDER BY a2.update_time DESC LIMIT 1) t1,(\n" +
            "SELECT a3.city FROM air_data a3 WHERE a3.province=#{provinceName} AND a3.city_flag=1 GROUP BY a3.city) t2 WHERE a.city=t2.city AND a.city_flag=0 AND a.update_time=t1.update_time GROUP BY a.city,a.quality")
    List<PointQualityDto> getPointQualityByProvinceName(String provinceName);
}