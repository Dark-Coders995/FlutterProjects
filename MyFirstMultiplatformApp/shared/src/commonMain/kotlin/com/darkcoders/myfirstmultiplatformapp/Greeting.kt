package com.darkcoders.myfirstmultiplatformapp

class Greeting {
    fun greeting(): String {
        return "Hello, ${Platform().platform}!"
    }
}