library(shiny)

individual_genes <- read.csv("as_genes.csv", head=TRUE)
combined_risk <- read.csv("as_combined_risks.csv", head=TRUE)

# In rare disease, relative risk ~= odds ratios
calculate_as_risk <- function(prevalence, erap1_genotype, hlab27_genotype) {
    combined <- combined_risk[combined_risk$RS30187==erap1_genotype & combined_risk$RS4349859==hlab27_genotype,]
    return(prevalence * combined$RR)
}

shinyServer(
    function(input, output) {
        output$erap1_genotype <- renderPrint({input$rs31087})
        output$hlab27_genotype <- renderPrint({input$rs4349859})
        output$prevalence <- renderPrint({input$pop_prevalence})
        
        output$risk <- renderPrint({
            calculate_as_risk(input$pop_prevalence, input$rs31087, input$rs4349859)
        })
    }
)