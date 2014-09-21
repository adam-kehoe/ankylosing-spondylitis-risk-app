library(shiny)
shinyUI(pageWithSidebar(
    headerPanel("Ankyloysing Spondylitis Risk Prediction Based on the Interaction of the ERAP1 and HLA-B27 Genes"),
    sidebarPanel(
        selectInput('rs31087','Select your genotype for SNP rs31087',
                    c('CC', 'CT', 'TT')),
        selectInput('rs4349859','Select your genotype for SNP rs4349859',
                    c('GG', 'AG', 'AA')),
        sliderInput('pop_prevalence', 'Population Prevalence',value = .005, min = 0, max = 1, step = 0.005)
    ),
    mainPanel(
        h3("Explanation"),
        p("Ankylosing spondylitis is a chronic inflammatory disease with a strong genetic predisposition. 
          This project makes use of recent findings from a genome wide association study to predict the risk
          for ankylosing spondylitis given genetic data on two single nucleotide polymorphisms (SNPS)."),
        
        h3("Information on the Study"),
        p("This experimental application is based on the following paper:"),
        em("Evans DM, Spencer CC, Pointon JJ, et al. Interaction between ERAP1 and HLA-B27 in ankylosing spondylitis implicates peptide handling in the mechanism for HLA-B27 in disease susceptibility. Nat Genet. 2011;43(8):761-7."),
        a("Paper Link", href="http://www.ncbi.nlm.nih.gov/pubmed/21743469"),
        h3("Disclaimer"),
        p("This information is provided on an experimental basis only, intended only for
          is meant for basic informational purposes only. It is not intended to serve as medical advice,
          substitute for a doctor’s appointment or to be used for diagnosing or treating a disease."),
        
        h3("How to Use This Tool"),
        p("In the left panel, select a genotype for the two listed SNPs. Below, you can select a value for the incidence rate
          of ankylosing spondylitis. Selecting a lower probability indicates a belief that AS is more rare, while a higher value indicates a belief that it
          is more common. The default setting is set to a commonly published incidence rate."),
        
        h3("Results"),
        h4("Your ERPA1 genotype selection:", textOutput("erap1_genotype")),
        h4("Your HLAB-27 genotype selection:", textOutput("hlab27_genotype")),
        h4("Your population prevalence estimate:", textOutput("prevalence")),
        h4("ERAP1 risk", textOutput("risk"))
        
    )
))