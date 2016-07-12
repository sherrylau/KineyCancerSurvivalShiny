library(XML)

# xml_test = xmlParse("~/Desktop/PSDS0001840.xml")
# # xml_test = xmlToDataFrame(xml_test)
# xmlToList(xml_test)

#### 1. KICH ####
data_list = NULL
allXMLfile = list.files(path = "KICH/XML/batch1/")
for (i in 1:length(allXMLfile)){
  filename = allXMLfile[i]
  x = xmlParse(paste("KICH/XML/batch1/", filename, sep=""))
  x =  xmlToDataFrame(x)
  data_list[[i]] = x
  print(paste(i,ncol(x),filename))
}
data1 = do.call(rbind.data.frame, data_list)
data1.1 = data[which(names(data) %in% c("bcr","file_uuid","batch_number","project_code","disease_code","day_of_dcc_upload","month_of_dcc_upload","year_of_dcc_upload","additional_studies"))]
data1.1 = data1.1[!is.na(data1.1$bcr),]
data1.2 = data[which(names(data) %in% c("bcr_patient_barcode","bcr_patient_uuid","tissue_source_site","patient_id","gender","days_to_index","bcr_canonical_check","samples"))]
data1.2 = data1.2[!is.na(data1.2$bcr_patient_barcode),]
data1 = cbind(data1.1, data1.2)
remove(data1.1)
remove(data1.2)

data_list = NULL
allXMLfile = list.files(path = "KICH/XML/batch2/")
for (i in 1:length(allXMLfile)){
  filename = allXMLfile[i]
  x = xmlParse(paste("KICH/XML/batch2/", filename, sep=""))
  x = xmlToDataFrame(x)
  data_list[[i]] = x
  print(paste(i,ncol(x),filename))
}
data2 = do.call(rbind.data.frame, data_list)
data2.1 = data2[which(names(data2) %in% c("bcr","file_uuid","batch_number","project_code","disease_code","day_of_dcc_upload","month_of_dcc_upload","year_of_dcc_upload","patient_withdrawal","additional_studies"))]
data2.1 = data2.1[!is.na(data2.1$bcr),]
data2.2 = data2[-which(names(data2) %in% c("bcr","file_uuid","batch_number","project_code","disease_code","day_of_dcc_upload","month_of_dcc_upload","year_of_dcc_upload","patient_withdrawal","additional_studies"))]
data2.2 = data2.2[!is.na(data2.2$tissue_source_site),]
data2 = cbind(data2.1, data2.2)
remove(data2.1)
remove(data2.2)

data_list = NULL
allXMLfile = list.files(path = "KICH/XML/batch3/")
for (i in 1:length(allXMLfile)){
  filename = allXMLfile[i]
  x = xmlParse(paste("KICH/XML/batch3/", filename, sep=""))
  x = xmlToDataFrame(x)
  data_list[[i]] = x
  print(paste(i,ncol(x),filename))
}
data3 = do.call(rbind.data.frame, data_list)
data3.1 = data3[which(names(data3) %in% c("bcr","file_uuid","batch_number","project_code","disease_code","day_of_dcc_upload","month_of_dcc_upload","year_of_dcc_upload","patient_withdrawal","additional_studies"))]
data3.1 = data3.1[!is.na(data3.1$bcr),]
data3.2 = data3[-which(names(data3) %in% c("bcr","file_uuid","batch_number","project_code","disease_code","day_of_dcc_upload","month_of_dcc_upload","year_of_dcc_upload","patient_withdrawal","additional_studies"))]
data3.2 = data3.2[!is.na(data3.2$tissue_source_site),]
data3 = cbind(data3.1, data3.2)
remove(data3.1)
remove(data3.2)

data_list = NULL
allXMLfile = list.files(path = "KICH/XML/batch4/")
for (i in 1:length(allXMLfile)){
  filename = allXMLfile[i]
  x = xmlParse(paste("KICH/XML/batch4/", filename, sep=""))
  x = xmlToDataFrame(x)
  data_list[[i]] = x
  print(paste(i, ncol(x),filename))
}
data4 = do.call(rbind.data.frame, data_list)
data4.1 = data4[which(names(data4) %in% c("bcr","file_uuid","batch_number","project_code","disease_code","day_of_dcc_upload","month_of_dcc_upload","year_of_dcc_upload","patient_withdrawal","additional_studies"))]
data4.1 = data4.1[!is.na(data4.1$bcr),]
data4.2 = data4[-which(names(data4) %in% c("bcr","file_uuid","batch_number","project_code","disease_code","day_of_dcc_upload","month_of_dcc_upload","year_of_dcc_upload","patient_withdrawal","additional_studies"))]
data4.2 = data4.2[!is.na(data4.2$bcr_patient_barcode),]
data4 = cbind(data4.1, data4.2)
remove(data4.1)
remove(data4.2)

data_kich = data2
remove(data1,data2,data3,data4)

#### 2. KIRC ####
data_list = NULL
allXMLfile = list.files(path = "KIRC/XML/batch1/")
for (i in 1:length(allXMLfile)){
  filename = allXMLfile[i]
  x = xmlParse(paste("KIRC/XML/batch1/", filename, sep=""))
  x = xmlToDataFrame(x)
  data_list[[i]] = x
  print(paste(i, ncol(x), filename))
}
data1 = do.call(rbind.data.frame, data_list)
data1.1 = data1[which(names(data1) %in% c("bcr","file_uuid","batch_number","project_code","disease_code","day_of_dcc_upload","month_of_dcc_upload","year_of_dcc_upload","additional_studies"))]
data1.1 = data1.1[!is.na(data1.1$bcr),]
data1.2 = data1[-which(names(data1) %in% c("bcr","file_uuid","batch_number","project_code","disease_code","day_of_dcc_upload","month_of_dcc_upload","year_of_dcc_upload","additional_studies"))]
data1.2 = data1.2[!is.na(data1.2$bcr_patient_barcode),]
data1 = cbind(data1.1, data1.2)
remove(data1.1, data1.2)

data_list = NULL
allXMLfile = list.files(path = "KIRC/XML/batch2/")
for (i in 1:length(allXMLfile)){
  filename = allXMLfile[i]
  x = xmlParse(paste("KIRC/XML/batch2/", filename, sep=""))
  x = xmlToDataFrame(x)
  data_list[[i]] = x
  print(paste(i, ncol(x), filename))
}
data2 = do.call(rbind.data.frame, data_list)
data2.1 = data2[which(names(data2) %in% c("bcr","file_uuid","batch_number","project_code","disease_code","day_of_dcc_upload","month_of_dcc_upload","year_of_dcc_upload","patient_withdrawal","additional_studies"))]
data2.1 = data2.1[!is.na(data2.1$bcr),]
data2.2 = data2[-which(names(data2) %in% c("bcr","file_uuid","batch_number","project_code","disease_code","day_of_dcc_upload","month_of_dcc_upload","year_of_dcc_upload","patient_withdrawal","additional_studies"))]
data2.2 = data2.2[!is.na(data2.2$tumor_tissue_site),]
data2 = cbind(data2.1, data2.2)
remove(data2.1, data2.2)

data_list = NULL
allXMLfile = list.files(path = "KIRC/XML/batch3/")
for (i in 1:length(allXMLfile)){
  filename = allXMLfile[i]
  x = xmlParse(paste("KIRC/XML/batch3/", filename, sep=""))
  x = xmlToDataFrame(x)
  data_list[[i]] = x
  print(paste(i, ncol(x), filename))
}
data3 = do.call(rbind.data.frame, data_list)
data3.1 = data3[which(names(data3) %in% c("bcr","file_uuid","batch_number","project_code","disease_code","day_of_dcc_upload","month_of_dcc_upload","year_of_dcc_upload","patient_withdrawal","additional_studies"))]
data3.1 = data3.1[!is.na(data3.1$bcr),]
data3.2 = data3[-which(names(data3) %in% c("bcr","file_uuid","batch_number","project_code","disease_code","day_of_dcc_upload","month_of_dcc_upload","year_of_dcc_upload","patient_withdrawal","additional_studies"))]
data3.2 = data3.2[!is.na(data3.2$tissue_source_site),]
data3 = cbind(data3.1, data3.2)
remove(data3.1, data3.2)

data_list = NULL
allXMLfile = list.files(path = "KIRC/XML/batch4/")
for (i in 1:length(allXMLfile)){
  filename = allXMLfile[i]
  x = xmlParse(paste("KIRC/XML/batch4/", filename, sep=""))
  x = xmlToDataFrame(x)
  data_list[[i]] = x
  print(paste(i, ncol(x), filename))
}
data4 = do.call(rbind.data.frame, data_list)
data4.1 = data4[which(names(data4) %in% c("bcr","file_uuid","batch_number","project_code","disease_code","day_of_dcc_upload","month_of_dcc_upload","year_of_dcc_upload","patient_withdrawal","additional_studies"))]
data4.1 = data4.1[!is.na(data4.1$bcr),]
data4.2 = data4[-which(names(data4) %in% c("bcr","file_uuid","batch_number","project_code","disease_code","day_of_dcc_upload","month_of_dcc_upload","year_of_dcc_upload","patient_withdrawal","additional_studies"))]
data4.2 = data4.2[!is.na(data4.2$bcr_patient_barcode),]
data4 = cbind(data4.1, data4.2)
remove(data4.1, data4.2)

data_kirc = data2
remove(data1, data2, data3, data4)

#### 3. KIRP ####
data_list = NULL
allXMLfile = list.files(path = "KIRP/XML/batch1/")
for (i in 1:length(allXMLfile)){
  filename = allXMLfile[i]
  x = xmlParse(paste("KIRP/XML/batch1/", filename, sep=""))
  x = xmlToDataFrame(x)
  data_list[[i]] = x
  print(paste(i, ncol(x), filename))
}
data1 = do.call(rbind.data.frame, data_list)
data1.1 = data1[which(names(data1) %in% c("bcr","file_uuid","batch_number","project_code","disease_code","day_of_dcc_upload","month_of_dcc_upload","year_of_dcc_upload","additional_studies"))]
data1.1 = data1.1[!is.na(data1.1$bcr),]
data1.2 = data1[-which(names(data1) %in% c("bcr","file_uuid","batch_number","project_code","disease_code","day_of_dcc_upload","month_of_dcc_upload","year_of_dcc_upload","additional_studies"))]
data1.2 = data1.2[!is.na(data1.2$bcr_patient_barcode),]
data1 = cbind(data1.1, data1.2)
remove(data1.1, data1.2)

data_list = NULL
allXMLfile = list.files(path = "KIRP/XML/batch2/")
for (i in 1:length(allXMLfile)){
  filename = allXMLfile[i]
  x = xmlParse(paste("KIRP/XML/batch2/", filename, sep=""))
  x = xmlToDataFrame(x)
  data_list[[i]] = x
  print(paste(i, ncol(x), filename))
}
data2 = do.call(rbind.data.frame, data_list)
data2.1 = data2[which(names(data2) %in% c("bcr","file_uuid","batch_number","project_code","disease_code","day_of_dcc_upload","month_of_dcc_upload","year_of_dcc_upload","patient_withdrawal","additional_studies"))]
data2.1 = data2.1[!is.na(data2.1$bcr),]
data2.2 = data2[-which(names(data2) %in% c("bcr","file_uuid","batch_number","project_code","disease_code","day_of_dcc_upload","month_of_dcc_upload","year_of_dcc_upload","patient_withdrawal","additional_studies"))]
data2.2 = data2.2[!is.na(data2.2$tumor_tissue_site),]
data2 = cbind(data2.1, data2.2)
remove(data2.1, data2.2)

data_list = NULL
allXMLfile = list.files(path = "KIRP/XML/batch3/")
for (i in 1:length(allXMLfile)){
  filename = allXMLfile[i]
  x = xmlParse(paste("KIRP/XML/batch3/", filename, sep=""))
  x = xmlToDataFrame(x)
  data_list[[i]] = x
  print(paste(i, ncol(x), filename))
}
data3 = do.call(rbind.data.frame, data_list)
data3.1 = data3[which(names(data3) %in% c("bcr","file_uuid","batch_number","project_code","disease_code","day_of_dcc_upload","month_of_dcc_upload","year_of_dcc_upload","patient_withdrawal","additional_studies"))]
data3.1 = data3.1[!is.na(data3.1$bcr),]
data3.2 = data3[-which(names(data3) %in% c("bcr","file_uuid","batch_number","project_code","disease_code","day_of_dcc_upload","month_of_dcc_upload","year_of_dcc_upload","patient_withdrawal","additional_studies"))]
data3.2 = data3.2[!is.na(data3.2$tissue_source_site),]
data3 = cbind(data3.1, data3.2)
remove(data3.1, data3.2)

data_list = NULL
allXMLfile = list.files(path = "KIRP/XML/batch4/")
for (i in 1:length(allXMLfile)){
  filename = allXMLfile[i]
  x = xmlParse(paste("KIRP/XML/batch4/", filename, sep=""))
  x = xmlToDataFrame(x)
  data_list[[i]] = x
  print(paste(i, ncol(x), filename))
}
data4 = do.call(rbind.data.frame, data_list)
data4.1 = data4[which(names(data4) %in% c("bcr","file_uuid","batch_number","project_code","disease_code","day_of_dcc_upload","month_of_dcc_upload","year_of_dcc_upload","patient_withdrawal","additional_studies"))]
data4.1 = data4.1[!is.na(data4.1$bcr),]
data4.2 = data4[-which(names(data4) %in% c("bcr","file_uuid","batch_number","project_code","disease_code","day_of_dcc_upload","month_of_dcc_upload","year_of_dcc_upload","patient_withdrawal","additional_studies"))]
data4.2 = data4.2[!is.na(data4.2$bcr_patient_barcode),]
data4 = cbind(data4.1, data4.2)
remove(data4.1, data4.2)

data_kirp = data2
remove(data1, data2, data3, data4)
