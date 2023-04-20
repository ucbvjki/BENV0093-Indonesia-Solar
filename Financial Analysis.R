
# Net Present Value (NPV) -------------------------------------------------
#CAPEX
total_capacity <- 38901.336
capacity_cost <- 1160000

grid_distance <- 1559.34 
network_cost <- 590

CAPEX <- (total_capacity * capacity_cost) + (grid_distance * network_cost)
CAPEX #45,126,469,771

#Annual Revenue (yearly solar generation * electricity selling price)
annual_revenue <- 38950.13 * 8760 * 0.24 * 103  
annual_revenue #8,434,541,591

calc_NPV <- function(annual_revenue, i=0.05, lifetime_yrs, CAPEX, OPEX=0){

  costs_op <- rep(OPEX, lifetime_yrs+1) #operating cost
  revenue <- rep(annual_revenue, lifetime_yrs+1) 
  t <- seq(0, lifetime_yrs, 1) #output: 0, 1, 2, 3, ...25
  
  NPV <- sum( (revenue - costs_op)/((1 + i)^t) ) - CAPEX
  return(round(NPV, 0))
}

npv=calc_NPV(annual_revenue = 8434541591,lifetime_yrs=25, CAPEX=45126469771)
ifelse(npv>0, "Support","object")


#Levelised Cost of Electricity (LCOE)=====

yearly_generation_kWh = 38950.13 * 8760 * 0.24 * 1000
yearly_generation_kWh #81,888,753,312

LSG_kWh <- function (yearly_generation_kWh, discount = 0.08, lifetime_yrs = 25){
  t<- seq(0, lifetime_yrs, 1)
  L_S_G <- sum(yearly_generation_kWh/(1+discount)**t)
  return (round(L_S_G,0))
}

LSG_kWh(yearly_generation_kWh=81888753312, discount = 0.08, lifetime_yrs = 25)

LCOE <- function(NPV,LSG){
  lcoe <- NPV/LSG
  return(round(lcoe,2))
}

LCOE(NPV=82184033444, LSG = 956032867280)
