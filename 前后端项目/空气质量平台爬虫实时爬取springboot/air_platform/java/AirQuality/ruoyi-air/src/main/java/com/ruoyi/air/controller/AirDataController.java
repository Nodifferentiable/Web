package com.ruoyi.air.controller;

import java.net.URLEncoder;
import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.common.utils.http.HttpUtils;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.air.domain.AirData;
import com.ruoyi.air.service.IAirDataService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 空气质量数据Controller
 *
 * @author ruoyi
 * @date 2023-10-28
 */
@RestController
@RequestMapping("/air/air")
public class AirDataController extends BaseController {
    @Autowired
    private IAirDataService airDataService;

    /**
     * 查询空气质量数据列表
     */
    @PreAuthorize("@ss.hasPermi('air:air:list')")
    @GetMapping("/list")
    public TableDataInfo list(AirData airData) {
        startPage();
        List<AirData> list = airDataService.selectAirDataList(airData);
        return getDataTable(list);
    }

    /**
     * 导出空气质量数据列表
     */
    @PreAuthorize("@ss.hasPermi('air:air:export')")
    @Log(title = "空气质量数据", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, AirData airData) {
        List<AirData> list = airDataService.selectAirDataList(airData);
        ExcelUtil<AirData> util = new ExcelUtil<AirData>(AirData.class);
        util.exportExcel(response, list, "空气质量数据数据");
    }

    /**
     * 获取空气质量数据详细信息
     */
    @PreAuthorize("@ss.hasPermi('air:air:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id) {
        return success(airDataService.selectAirDataById(id));
    }

    /**
     * 新增空气质量数据
     */
    @PreAuthorize("@ss.hasPermi('air:air:add')")
    @Log(title = "空气质量数据", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody AirData airData) {
        return toAjax(airDataService.insertAirData(airData));
    }

    /**
     * 修改空气质量数据
     */
    @PreAuthorize("@ss.hasPermi('air:air:edit')")
    @Log(title = "空气质量数据", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody AirData airData) {
        return toAjax(airDataService.updateAirData(airData));
    }

    /**
     * 删除空气质量数据
     */
    @PreAuthorize("@ss.hasPermi('air:air:remove')")
    @Log(title = "空气质量数据", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids) {
        return toAjax(airDataService.deleteAirDataByIds(ids));
    }


    @GetMapping("/getCityDataByProvinceName/{provinceName}")
    public AjaxResult getCityDataByProvinceName(@PathVariable("provinceName") String provinceName){
        return success(airDataService.getCityDataByProvinceName(provinceName));
    }

    @GetMapping("/getCityQualityByProvinceName/{provinceName}")
    public AjaxResult getCityQualityByProvinceName(@PathVariable("provinceName") String provinceName){
        return success(airDataService.getCityQualityByProvinceName(provinceName));
    }

    @GetMapping("/getPointQualityByProvinceName/{provinceName}")
    public AjaxResult getPointQualityByProvinceName(@PathVariable("provinceName") String provinceName){
        return success(airDataService.getPointQualityByProvinceName(provinceName));
    }



    @GetMapping("/getNewestDataByProvinceName/{provinceName}")
    public AjaxResult getNewestDataByProvinceName(@PathVariable("provinceName") String provinceName){
        String s = HttpUtils.sendGet("http://127.0.0.1:5000/getData", "provinceName="+URLEncoder.encode(provinceName));
        return success();
    }


}
