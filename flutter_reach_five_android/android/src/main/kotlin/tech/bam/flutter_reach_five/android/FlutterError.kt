package tech.bam.flutter_reach_five.android

class FlutterError constructor(code: String, message: String?, details: Any?) :
    RuntimeException(message) {
    private val code: String
    private val details: Any?

    init {
        this.code = code
        this.details = details
    }
}