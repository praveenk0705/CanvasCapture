
package canvascapture

import grails.converters.JSON

class ContributionsController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def jsonPeople = {
		def myHomeAddress = [
				building:"25",
				street: "High Street",
				city:"Cambridge",
				country:"UK",
				pref: true]

		def myWorkAddress = [
				building:"1",
				street: "Science Park",
				city:"Cambridge",
				country:"UK"]

		def dave = [
				name: "David Bower",
				address: [myHomeAddress, myWorkAddress]]

		def people = [people:[dave]]
		def convertor = people as JSON;
		println convertor
		
		convertor.render(new
			java.io.FileWriter("flare2.json"));
		
		render people as JSON
	}
	
	
	
	
	def retriveData = {
		println "${params.picId}"
		println "inside ajax test"
		def list=Contributions.findByPicId(params.picId)
		println "###${list}"
		def a=[cont:list.contribution,contType:list.contributionType,email:list.email,name:list.name , city:list.city , age:list.age]
		
		println "**${a}"
		
		render (a as JSON)
		
	}
	def getCity = {
		println "the params are ${params}"
		def cityname = params["cityname"]
		def b = Contributions.executeQuery("select picId from Contributions where city = 'bang' ")
		def a = Contributions.executeQuery("select count(picId) from Contributions where city = 'bang'")
		println "a is ${b}"
		def listForCity = Contributions.findByContribution("abc")
		println "dgf ${listForCity}"
		def city = [:]
		
		listForCity.each(){
			city.put(it.name,listForCity.picId)
		}
		
		
		println "gggggggggggg ${city}"
		[picId : b , countOfPic : a[0]]  
	}
	
	def showView ={
		
		def a = Contributions.executeQuery("select picId from Contributions")
		println a;
		[picId : a]
		
	}
	
	def db={
		if(!grails.util.GrailsUtil.environment.equalsIgnoreCase("PRODUCTION")){
			org.hsqldb.util.DatabaseManagerSwing.main(new String[0])
			Thread.sleep 100000
			}
	
}


    def save = {
       
		/*
		 def contributionsInstance = new Contributions(params)
        if (contributionsInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'contributions.label', default: 'Contributions'), contributionsInstance.id])}"
            //redirect(action: "showView.gsp", id: contributionsInstance.id)
			redirect(action: "showView")
        }
        else {
            render(view: "create", model: [contributionsInstance: contributionsInstance])
        }
    
		*/
		
		
		println "the params are.......... ${params}"
		def contributionToSave = new Contributions() ;
		
		contributionToSave.name = params["name"]
		contributionToSave.email = params["email"]
		contributionToSave.contribution = params["cont"]
		contributionToSave.contributionType = params ["contType"]
		def picId = Integer.parseInt (params["picId"])
		contributionToSave.picId = picId
		
		
		
		contributionToSave.city = params ["city"]
		def age = Integer.parseInt (params["age"])
		contributionToSave.age = age
		
		
		if (contributionToSave.save(flush: true)) {
            flash.message = "thanks for ur contribution"
            //redirect(action: "showView.gsp", id: contributionsInstance.id)
			redirect(action: "showView")
        }
        else {
			flash.message = "Something went wrong, try again"
            redirect(action: "showView")
        }
    
		
		
		//new code
		
		
		
		/*if(session["email"]==null){
		def contributionsInstance = new Contributions(params)
		if (contributionsInstance.save(flush: true)) {
			flash.message = "${message(code: 'default.created.message', args: [message(code: 'contributions.label', default: 'Contributions'), contributionsInstance.id])}"
		  
			println "params are .. ${params}"
			def cont = params["email"]
			
			session['email'] = cont
			def h = session["email"]
			println "the session is ${h}"
			 // redirect(action: "show", id: contributionsInstance.id)
			redirect(action: "showView")
			
		  
			
		}
		else {
			render(view: "create", model: [contributionsInstance: contributionsInstance])
		}
		}
		else
		{
			def h = session["email"]
			println "the session is ${h}"
			flash.message = "Sorry U have already made the contribution"
			redirect(action: 'showView')
		}*/
		
		//new code end

		}

    
    
}
