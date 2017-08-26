<#include "/java_copyright.include">
<#assign className = table.className>
<#assign classNameLower = className?uncap_first>

package ${basepackage}.controller;

import ${basepackage}.model.${className};
import com.github.pagehelper.Page;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.liz.common.pojo.RequestModel;
import ${basepackage}.service.${className}Service;

import org.springframework.stereotype.Controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.List;


@Controller
@RequestMapping("/${classNameLower}")
public class ${className}Controller {

    private static Log log = LogFactory.getLog(${className}Controller.class);

    @Autowired
    private ${className}Service ${classNameLower}Service;

    /**
     * 通过主键查询实体对象
     * @return
     */
    @RequestMapping(value = "/getByPK/{key}", method = RequestMethod.GET)
    @ResponseBody
    public ${className} getByPK(@PathVariable("key") Integer key) throws Exception {
        return ${classNameLower}Service.getByPK(key);
    }

    /**
     * 分页查询记录
     * @return
     */
    @RequestMapping(value = {"/findByPage"}, method = RequestMethod.POST)
    @ResponseBody
    public Page<${className}> findByPage(@RequestBody RequestModel<${className}> requestModel) throws Exception {
        Page<${className}> page = new Page<${className}>();
        page.setPageNum(requestModel.getPageNo());
        page.setPageSize(requestModel.getPageSize());
        return ${classNameLower}Service.findByPage(page, requestModel.getParam());
    }

    /**
     * 新增记录
     * @return
     */
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public void add(@RequestBody ${className} ${classNameLower}) throws Exception {
        ${classNameLower}Service.save(${classNameLower});
    }

    /**
     * 根据多条主键值删除记录
     * @return
     */
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public void delete(@RequestBody List<Integer> list) throws Exception {
        ${classNameLower}Service.deleteByPKeys(list);
    }

    /**
     * 修改记录
     * @return
     */
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public void update(@RequestBody ${className} ${classNameLower}) throws Exception {
        ${classNameLower}Service.update(${classNameLower});
    }

}


