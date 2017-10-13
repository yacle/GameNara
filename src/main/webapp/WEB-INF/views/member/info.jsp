<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<h2 align="center">${auth_id} Info</h2>
  <form class="form-horizontal" action="/action_page.php">
  	<div class="row" style="align:center">
  		<div class="col-md-1"></div>
  		<div class="col-md-3">
  			<div class="well" style="width:250px; height:250px;">profile</div>
  			<div class="form-group">        
      			<div class="col-sm-offset-0 col-sm-12" align="center">
        		<button type="submit" class="btn btn-default">변경</button>
      			</div>
    		</div>
  		</div>
  		<div class="col-md-7">
		    <div class="form-group">
		      <label class="control-label col-sm-3" for="name">Name:</label>
		      <div class="col-sm-9">
		        <input type="text" class="form-control" id="name" placeholder="Enter Name" name="name">
		      </div>
		    </div>
		    <div class="form-group">
		      <label class="control-label col-sm-3" for="name">Gender:</label>
		      <div class="col-sm-9">
		        <select class="form-control" id="sel1">
			        <option>Male</option>
			        <option>Female</option>
			      </select>
		      </div>
		    </div>
		    <div class="form-group">
		      <label class="control-label col-sm-3" for="email">Email:</label>
		      <div class="col-sm-9">
		        <input type="email" class="form-control" id="email" placeholder="Enter email" name="email">
		      </div>
		    </div>
		    <div class="form-group">
		      <label class="control-label col-sm-3" for="phone">Phone-Number:</label>
		      <div class="col-sm-9">          
		        <input type="text" class="form-control" id="phone" placeholder="Enter Phone Number" name="phone">
		      </div>
		    </div>
		    <div class="form-group">
		      <label class="control-label col-sm-3" for="addr">ADDRESS:</label>
		      <div class="col-sm-9">          
		        <input type="text" class="form-control" id="addr" placeholder="Enter Address" name="addr">
		      </div>
		    </div>
		    <div class="form-group">
		      <label class="control-label col-sm-3" for="birth">BIRTH:</label>
		      <div class="col-sm-9">          
		        <input type="date" class="form-control" id="birth" placeholder="Enter Birth" name="birth">
		      </div>
		    </div>
		 </div> 
		 <div class="col-md-1"></div>  
    </div>
    <div class="form-group">        
      <div class="col-sm-offset-0 col-sm-12" align="center">
        <button type="submit" class="btn btn-default">Submit</button>
      </div>
    </div>
    
  </form>