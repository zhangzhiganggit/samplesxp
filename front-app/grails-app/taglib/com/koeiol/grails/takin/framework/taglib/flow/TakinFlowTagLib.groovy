package com.koeiol.grails.takin.framework.taglib.flow

class TakinFlowTagLib {

    static namespace = "flow"
    static defaultEncodeAs = [taglib:'none']
    //static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]

    def flowExecutionRepository

    def caption = { Map attrs ->
        out << g.message(code: "controller.$controllerName.$actionName.${getStateId()}")
    }

    /*

    def stateIndex = { out << getStateIndex() }

    def stateCount = {
        out << getViewStateIds().size()
    }

    def renderStep = {
        out << '<span class="step-title"> Step ' << getStateIndex() + 1 << ' of ' << getViewStateIds().size() << ' </span>'
    }

    def renderStatus = {
        out << g.render(template: '/takin/std/flow/status', model:[viewStateIds: getViewStateIds(), currentIndex: getStateIndex()])
    }

    def renderFormBody = {
        out << g.render(template: "/$controllerName/$actionName/${(stateId)}")
    }

    def renderActions = {
        ViewState state = getFlowExecution().activeSession.state
        out << g.render(template: '/takin/std/flow/actions', model:[transitions: state.transitions])
    }

    def getStateIndex() {
        return getViewStateIds().indexOf(getStateId())
    }

    def getStateId() {
        return getFlowExecution().activeSessionInternal.stateId
    }

    List<String> getViewStateIds() {
        def states = getFlowExecution()?.flow?.states
        return states ?  states.findAll { it instanceof ViewState || it instanceof EndState }*.id : []
    }

    private FlowExecutionImpl getFlowExecution() {
        if (flowExecutionKey) {
            return flowExecutionRepository.getFlowExecution((flowExecutionKey))
        }
        return null
    }

    private FlowExecutionKey getFlowExecutionKey() {
        if (params.execution) {
            String key = (params.execution instanceof String[]) ? params.execution[0] : params.execution
            return flowExecutionRepository.parseFlowExecutionKey(key)
        }
        return null
    }
*/
}
