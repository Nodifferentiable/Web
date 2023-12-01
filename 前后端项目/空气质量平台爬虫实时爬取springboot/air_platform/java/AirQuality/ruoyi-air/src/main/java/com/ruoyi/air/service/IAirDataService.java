package com.ruoyi.air.service;

import java.util.List;
import java.util.Map;

import com.baomidou.mybatisplus.extension.service.IService;
import com.ruoyi.air.domain.AirData;
import com.ruoyi.air.domain.vo.CityDataVo;
import com.ruoyi.air.domain.vo.PointQualityVo;

/**
 * 空气质量数据Service接口
 *
 * @author ruoyi
 * @date 2023-10-28
 */
public interface IAirDataService extends IService<AirData> {
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
     * 批量删除空气质量数据
     *
     * @param ids 需要删除的空气质量数据主键集合
     * @return 结果
     */
    public int deleteAirDataByIds(Long[] ids);

    /**
     * 删除空气质量数据信息
     *
     * @param id 空气质量数据主键
     * @return 结果
     */
    public int deleteAirDataById(Long id);

    /**
     * 获取城市最新空气数据
     *
     * @param provinceName 省名称
     * @return 结果
     */
    List<CityDataVo> getCityDataByProvinceName(String provinceName);

    /**
     * 获取城市最新空气质量
     * @param provinceName
     * @return
     */
    List<Map<String,Integer>> getCityQualityByProvinceName(String provinceName);

    /**
     * 获取站点最新空气质量
     * @param provinceName
     * @return
     */
    List<PointQualityVo> getPointQualityByProvinceName(String provinceName);

}