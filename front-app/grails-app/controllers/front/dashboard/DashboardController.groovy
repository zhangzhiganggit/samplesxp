package front.dashboard

import grails.converters.JSON
import grails.transaction.Transactional
import groovy.json.JsonSlurper
import System.HomeUserPanels

import java.text.SimpleDateFormat

class DashboardController {

    def takinThemeService

    def springSecurityService

    def sspDashBoardService

    def orgTypeService

    def sspNoticeService
    /**
     *
     */
    def index() {}

    /**
     * 显示首页
     * @return
     */
    def showFirstMenu() {
        String menuId = params.firstMenuId
        render g.render(template: takinThemeService.getThemeTemplate(menuId, 'menu'))
    }

    /**
     * 首页获取用户面板数据
     */
    @Transactional
    def getUserPanels() {
        def homeUserPanelsInstance = HomeUserPanels.findAllByUserCode('110665')
        render "xxx欢迎光临"
    }

    /**
     * 首页修改用户面板顺序
     * @returng
     */
    @Transactional
    def updateUserPanels() {
        def panels = request.getParameter("panels");
        def homeUserPanelsInstance = HomeUserPanels.findByUserCode(springSecurityService.currentUser.userCode)
        homeUserPanelsInstance.panels = panels
        homeUserPanelsInstance.save flush: true
        //返回前台数据
        render "1"
    }
    /**
     * 显示快捷菜单
     * @return
     */
    def showShortcutMenu() {
        def beforeMenuList='[{"menuaction":"create","menucontroller":"merchantIncome"},{"menuaction":"index","menucontroller":"merchantManagement"},{"menuaction":"index","menucontroller":"handBrushMerchantManagement"},{"menuaction":"index","menucontroller":"attachedQuery"},{"menuaction":"index","menucontroller":"otherConsumeMerchantManagement"}]'
        render menu.shortcutMenu(menus: beforeMenuList, params: params)

    }
    /**
     * 商户交易额统计
     * @return
     */
    def showMerchantTradeAmountStatistics() {

    }
    /**
     * 公告
     *
     * @author qiudong
     */
    def showNotice() {

    }
    /**
     * 待办事项
     * @return
     */
    def showGtasks() {

    }

    /**
     * 进件数量统计
     * @return
     */
    def showMerchantIncomeNumberStatistics() {

    }
    /**
     * 进件业务员排名
     * @return
     */
    def showMerchantIncomeSalesmanRanks() {

    }
    /**
     * 进件下级机构排名
     * @return
     */
    def showMerchantIncomeOrgRanks() {

    }
    /**
     * 商户交易涨幅排名
     * @return
     */
    def showMerchantTradeIncreaseRanks() {

    }

    /**F
     * 商户交易跌幅排名
     * @return
     */
    def showMerchantTradeDecreaseRanks() {

    }
    /**
     * 商户交易额排名
     * @return
     */
    def showMerchantTradeAmountRanks() {

    }


    /**
     * 商户交易额统计
     * @return
     */
    def getMerchantTradeAmountStatistics() {
        render(template: "merchantTradeAmountStatisticsContent")

    }
    /**
     * 公告
     *
     * @author qiudong
     */
    def getNotice(Integer max) {
        render(template: "noticeContent")
    }
    /**
     * 待办事项
     * @return
     */
    def getGtasks() {
        render(template: "gtasksContent")
    }


    /**
     * 进件数量统计
     * @return
     */
    def getMerchantIncomeNumberStatistics() {

        render(template: "merchantIncomeNumberStatisticsContent")

    }
    /**
     * 进件业务员排名
     * @return
     */
    def getMerchantIncomeSalesmanRanks(Integer max) {

        render(template: "merchantIncomeSalesmanRanksContent")
    }
    /**
     * 进件下级机构排名
     * @return
     */
    def getMerchantIncomeOrgRanks() {

        render(template: "merchantIncomeOrgRanksContent")
    }
    /**
     * 商户交易涨幅排名
     * @return
     */
    def getMerchantTradeIncreaseRanks() {

        render(template: "merchantTradeIncreaseRanksContent")
    }

    /**
     * 商户交易跌幅排名
     * @return
     */
    def getMerchantTradeDecreaseRanks() {

        render(template: "merchantTradeDecreaseRanksContent")
    }
    /**
     * 商户交易额排名
     * @return
     */
    def getMerchantTradeAmountRanks() {

        render(template: "merchantTradeAmountRanksContent")
    }
    /**
     * 关注
     * @return
     */
    def getAttention() {

        render(template: "attentionContent")
    }


}
