package merchant

class MerchantIncome {
    String id
    String USR_ID
    String IN_MNO
    String MNO
    String MEC_TYPE_FLAG
    String MEC_CONNENT_TYPE
    String MEC_SOURCE
    String IS_XW
    String PARENT_IN_MNO
    String MEC_TYP
    String MEC_STS

    static constraints = {
    }

    static mapping = {
        table(name: 'T_BAP_MEC_IF')
        id(column: 'UUID', generator: 'uuid')
        version false
    }
    String toString() {
        return "${id}"
    }
}
