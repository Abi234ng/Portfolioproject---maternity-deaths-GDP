-- Data for maternity deaths been used
SELECT Entity, Year, Deaths_Ectopic_pregnancy, Deaths_Indirect_maternal_deaths, Deaths_Late_maternal_deaths, Deaths_Maternal_abortion_and_miscarriage, Deaths_Maternal_deaths_aggravated_by_HIV_AIDS, Deaths_Maternal_hemorrhage, Deaths_Maternal_hypertensive_disorders, Deaths_Maternal_obstructed_labor_and_uterine_rupture, Deaths_Maternal_sepsis_and_other_maternal_infections, Deaths_Other_maternal_disorders

FROM `caps-415921.portfolio_project_2.maternal_deaths`

order by 1,2,3

-- Looking at highest cause of maternity deaths across board
SELECT Entity, max(Deaths_Ectopic_pregnancy) as Ectopic_Preg, max(Deaths_Maternal_abortion_and_miscarriage) as Mat_Abortion_Misc, 
max(Deaths_Maternal_deaths_aggravated_by_HIV_AIDS) as HIV_AIDs, max(Deaths_Maternal_hemorrhage) as Maternal_Hemorrhage, 
max(Deaths_Maternal_hypertensive_disorders) as Hypertension, max(Deaths_Maternal_obstructed_labor_and_uterine_rupture) as Obstr_Lab_Uter_Rupt, 
max(Deaths_Maternal_sepsis_and_other_maternal_infections) as Sepsis_Infection

FROM `caps-415921.portfolio_project_2.maternal_deaths`

Group by Entity

order by 1,2,3

-- Looking at cause of maternity deaths in 2019
SELECT Entity, Year, Deaths_Ectopic_pregnancy, Deaths_Indirect_maternal_deaths, Deaths_Late_maternal_deaths, Deaths_Maternal_abortion_and_miscarriage, Deaths_Maternal_deaths_aggravated_by_HIV_AIDS, Deaths_Maternal_hemorrhage, Deaths_Maternal_hypertensive_disorders, Deaths_Maternal_obstructed_labor_and_uterine_rupture, Deaths_Maternal_sepsis_and_other_maternal_infections, Deaths_Other_maternal_disorders

FROM `caps-415921.portfolio_project_2.maternal_deaths`

Where Year = 2019

order by 1,2,3


-- Looking at highest cause of maternity deaths in the World
SELECT Entity, max(Deaths_Ectopic_pregnancy) as Ectopic_Preg, max(Deaths_Maternal_abortion_and_miscarriage) as Mat_Abortion_Misc, 
max(Deaths_Maternal_deaths_aggravated_by_HIV_AIDS) as HIV_AIDs, max(Deaths_Maternal_hemorrhage) as Maternal_Hemorrhage, 
max(Deaths_Maternal_hypertensive_disorders) as Hypertension, max(Deaths_Maternal_obstructed_labor_and_uterine_rupture) as Obstr_Lab_Uter_Rupt, 
max(Deaths_Maternal_sepsis_and_other_maternal_infections) as Sepsis_Infection

FROM `caps-415921.portfolio_project_2.maternal_deaths`

Where Entity = "World"

Group by Entity

order by 1,2,3

-- Looking at highest cause of maternity deaths in selected nations
SELECT Entity, max(Deaths_Ectopic_pregnancy) as Ectopic_Preg, max(Deaths_Maternal_abortion_and_miscarriage) as Mat_Abortion_Misc, 
max(Deaths_Maternal_deaths_aggravated_by_HIV_AIDS) as HIV_AIDs, max(Deaths_Maternal_hemorrhage) as Maternal_Hemorrhage, 
max(Deaths_Maternal_hypertensive_disorders) as Hypertension, max(Deaths_Maternal_obstructed_labor_and_uterine_rupture) as Obstr_Lab_Uter_Rupt, 
max(Deaths_Maternal_sepsis_and_other_maternal_infections) as Sepsis_Infection

FROM `caps-415921.portfolio_project_2.maternal_deaths`

Where Entity IN ('Nigeria', 'Egypt', 'South Africa', 'Kenya', 'United Kingdom', 'Greece', 'India', 'Afghanistan', 'Israel', 'United States', 'Canada', 'Australia', 'China', 'North Korea', 'Mexico', 'Philipines')

Group by Entity

order by 1,2,3

-- Total number of maternity deaths
SELECT Entity, Year, (Deaths_Ectopic_pregnancy+Deaths_Indirect_maternal_deaths+Deaths_Late_maternal_deaths+Deaths_Maternal_abortion_and_miscarriage+Deaths_Maternal_deaths_aggravated_by_HIV_AIDS+Deaths_Maternal_hemorrhage+Deaths_Maternal_hypertensive_disorders+Deaths_Maternal_obstructed_labor_and_uterine_rupture+Deaths_Maternal_sepsis_and_other_maternal_infections+Deaths_Other_maternal_disorders) as total_maternity_deaths

FROM `caps-415921.portfolio_project_2.maternal_deaths`

WHERE Entity NOT IN ('African Region', 'Central African Republic', 'East Asia & Pacific (WB)', 'Eastern Mediterranean Region (WHO)', 'Europe & Central Asia (WB)', 'European Region (WHO)', 'G20', 'Latin America & Carribean (WB)', 'Middle East & North Africa (WB)', 'North America (WB)', 'OECD Countries', 'Region of the Americas (WHO)', 'South Asia (WB)', 'South-East Asia Region (WHO)', 'Sub-Saharan Africa (WB)', 'Western Pacific Region (WHO)', 'World', 'World Bank High Income', 'World Bank Low Income', 'World Bank Lower Middle Income', 'World Bank Upper Middle Income')

Group by Entity, Year, total_maternity_deaths

order by 1,2,3

-- Total number of maternity deaths for selected countries
SELECT Entity, Year, (Deaths_Ectopic_pregnancy+Deaths_Indirect_maternal_deaths+Deaths_Late_maternal_deaths+Deaths_Maternal_abortion_and_miscarriage+Deaths_Maternal_deaths_aggravated_by_HIV_AIDS+Deaths_Maternal_hemorrhage+Deaths_Maternal_hypertensive_disorders+Deaths_Maternal_obstructed_labor_and_uterine_rupture+Deaths_Maternal_sepsis_and_other_maternal_infections+Deaths_Other_maternal_disorders) as total_maternity_deaths

FROM `caps-415921.portfolio_project_2.maternal_deaths`

Where Entity IN ('Nigeria', 'Egypt', 'South Africa', 'Kenya', 'United Kingdom', 'Greece', 'India', 'Afghanistan', 'Israel', 'United States', 'Canada', 'Australia', 'China', 'North Korea', 'Mexico', 'Philipines')

Group by Entity, Year, total_maternity_deaths

order by 1,2,3

-- GDP data
SELECT *

FROM `caps-415921.portfolio_project_2.gdp_per_capita`

-- Join GDP and Maternity data
SELECT mat.Entity, mat.Year, mat.Deaths_Ectopic_pregnancy, mat.Deaths_Maternal_abortion_and_miscarriage, mat.Deaths_Maternal_deaths_aggravated_by_HIV_AIDS, mat.Deaths_Maternal_hemorrhage, mat.Deaths_Maternal_hypertensive_disorders, mat.Deaths_Maternal_obstructed_labor_and_uterine_rupture, mat.Deaths_Maternal_sepsis_and_other_maternal_infections, GDP.GDP_per_capita

FROM `caps-415921.portfolio_project_2.maternal_deaths` as mat

JOIN `caps-415921.portfolio_project_2.gdp_per_capita` as GDP ON

mat.Entity = GDP.Entity and
mat.Year = GDP.Year

Order by 1,2,3

-- Sum join tables 
SELECT mat.Entity, mat.Year, (mat.Deaths_Ectopic_pregnancy+mat.Deaths_Indirect_maternal_deaths+mat.Deaths_Late_maternal_deaths+mat.Deaths_Maternal_abortion_and_miscarriage+mat.Deaths_Maternal_deaths_aggravated_by_HIV_AIDS+mat.Deaths_Maternal_hemorrhage+mat.Deaths_Maternal_hypertensive_disorders+mat.Deaths_Maternal_obstructed_labor_and_uterine_rupture+mat.Deaths_Maternal_sepsis_and_other_maternal_infections+mat.Deaths_Other_maternal_disorders) as total_mat_deaths, GDP.GDP_per_capita

FROM `caps-415921.portfolio_project_2.maternal_deaths` as mat

JOIN `caps-415921.portfolio_project_2.gdp_per_capita` as GDP ON

mat.Entity = GDP.Entity and
mat.Year = GDP.Year

WHERE mat.Entity NOT IN ('African Region', 'Central African Republic', 'East Asia & Pacific (WB)', 'Eastern Mediterranean Region (WHO)', 'Europe & Central Asia (WB)', 'European Region (WHO)', 'G20', 'Latin America & Carribean (WB)', 'Middle East & North Africa (WB)', 'North America (WB)', 'OECD Countries', 'Region of the Americas (WHO)', 'South Asia (WB)', 'South-East Asia Region (WHO)', 'Sub-Saharan Africa (WB)', 'Western Pacific Region (WHO)', 'World', 'World Bank High Income', 'World Bank Low Income', 'World Bank Lower Middle Income', 'World Bank Upper Middle Income')


--Visual 1 - Total number of maternity deaths
SELECT Entity, Year, (Deaths_Ectopic_pregnancy+Deaths_Indirect_maternal_deaths+Deaths_Late_maternal_deaths+Deaths_Maternal_abortion_and_miscarriage+Deaths_Maternal_deaths_aggravated_by_HIV_AIDS+Deaths_Maternal_hemorrhage+Deaths_Maternal_hypertensive_disorders+Deaths_Maternal_obstructed_labor_and_uterine_rupture+Deaths_Maternal_sepsis_and_other_maternal_infections+Deaths_Other_maternal_disorders) as total_maternity_deaths

FROM `caps-415921.portfolio_project_2.maternal_deaths`

WHERE Entity NOT IN ('African Region', 'Central African Republic', 'East Asia & Pacific (WB)', 'Eastern Mediterranean Region (WHO)', 'Europe & Central Asia (WB)', 'European Region (WHO)', 'G20', 'Latin America & Carribean (WB)', 'Middle East & North Africa (WB)', 'North America (WB)', 'OECD Countries', 'Region of the Americas (WHO)', 'South Asia (WB)', 'South-East Asia Region (WHO)', 'Sub-Saharan Africa (WB)', 'Western Pacific Region (WHO)', 'World', 'World Bank High Income', 'World Bank Low Income', 'World Bank Lower Middle Income', 'World Bank Upper Middle Income')

Group by Entity, Year, total_maternity_deaths

order by 1,2,3

-- Visual 2
SELECT mat.Entity, mat.Year, (mat.Deaths_Ectopic_pregnancy+mat.Deaths_Indirect_maternal_deaths+mat.Deaths_Late_maternal_deaths+mat.Deaths_Maternal_abortion_and_miscarriage+mat.Deaths_Maternal_deaths_aggravated_by_HIV_AIDS+mat.Deaths_Maternal_hemorrhage+mat.Deaths_Maternal_hypertensive_disorders+mat.Deaths_Maternal_obstructed_labor_and_uterine_rupture+mat.Deaths_Maternal_sepsis_and_other_maternal_infections+mat.Deaths_Other_maternal_disorders) as total_mat_deaths, GDP.GDP_per_capita

FROM `caps-415921.portfolio_project_2.maternal_deaths` as mat

JOIN `caps-415921.portfolio_project_2.gdp_per_capita` as GDP ON

mat.Entity = GDP.Entity and
mat.Year = GDP.Year

WHERE mat.Entity NOT IN ('African Region', 'Central African Republic', 'East Asia & Pacific (WB)', 'Eastern Mediterranean Region (WHO)', 'Europe & Central Asia (WB)', 'European Region (WHO)', 'G20', 'Latin America & Carribean (WB)', 'Middle East & North Africa (WB)', 'North America (WB)', 'OECD Countries', 'Region of the Americas (WHO)', 'South Asia (WB)', 'South-East Asia Region (WHO)', 'Sub-Saharan Africa (WB)', 'Western Pacific Region (WHO)', 'World', 'World Bank High Income', 'World Bank Low Income', 'World Bank Lower Middle Income', 'World Bank Upper Middle Income')