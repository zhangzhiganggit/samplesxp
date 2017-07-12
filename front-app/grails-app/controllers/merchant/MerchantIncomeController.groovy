package merchant

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class MerchantIncomeController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond MerchantIncome.list(params), model:[merchantIncomeCount: MerchantIncome.count()]
    }

    def show(MerchantIncome merchantIncome) {
        respond merchantIncome
    }

    def create() {
        respond new MerchantIncome(params)
    }

    @Transactional
    def save(MerchantIncome merchantIncome) {
        if (merchantIncome == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (merchantIncome.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond merchantIncome.errors, view:'create'
            return
        }

        merchantIncome.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'merchantIncome.label', default: 'MerchantIncome'), merchantIncome.id])
                redirect merchantIncome
            }
            '*' { respond merchantIncome, [status: CREATED] }
        }
    }

    def edit(MerchantIncome merchantIncome) {
        respond merchantIncome
    }

    @Transactional
    def update(MerchantIncome merchantIncome) {
        if (merchantIncome == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (merchantIncome.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond merchantIncome.errors, view:'edit'
            return
        }

        merchantIncome.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'merchantIncome.label', default: 'MerchantIncome'), merchantIncome.id])
                redirect merchantIncome
            }
            '*'{ respond merchantIncome, [status: OK] }
        }
    }

    @Transactional
    def delete(MerchantIncome merchantIncome) {

        if (merchantIncome == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        merchantIncome.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'merchantIncome.label', default: 'MerchantIncome'), merchantIncome.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'merchantIncome.label', default: 'MerchantIncome'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
