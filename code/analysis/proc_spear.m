clear

% loading data
load('../../experiments/spear/toMeasure16April2017/configurations.mat');

solving_time_feature1_2_7_10286 = preproc_spear('../../experiments/spear/measurements/feature1_2.7.spear.results_SWlin2006.10286.cnf.txt');
solving_time_amazon_2_7_10286 = preproc_spear('../../experiments/spear/measurements/amazon_micro_2.7.spear.results_SWlin2006.10286.cnf.txt');
solving_time_feature8_2_7_10286 = preproc_spear('../../experiments/spear/measurements/feature8_2.7.spear.results_SWlin2006.10286.cnf.txt');
solving_time_feature9_1_2_10286 = preproc_spear('../../experiments/spear/measurements/feature9_1.2.spear.results_SWlin2006.10286.cnf.txt');
solving_time_feature10_1_2_8287 = preproc_spear('../../experiments/spear/measurements/feature10_1.2.spear.results_SWlin2006.8287.cnf.txt');
solving_time_feature11_2_7_4435 = preproc_spear('../../experiments/spear/measurements/feature11_2.7.spear.results_SWlin2006.4435.cnf.txt');
solving_time_feature12_2_7_18830 = preproc_spear('../../experiments/spear/measurements/feature12_2.7.spear.results_SWlin2006.18830.cnf.txt');

% determining source and target

source_hardware = mean(solving_time_feature1_2_7_10286,2);
target_hardware = mean(solving_time_feature8_2_7_10286,2);
source_hardware1 = mean(solving_time_amazon_2_7_10286,2);
target_hardware1 = mean(solving_time_feature8_2_7_10286,2);

source_workload = mean(solving_time_feature8_2_7_10286,2);
target_workload = mean(solving_time_feature11_2_7_4435,2);
source_workload1 = mean(solving_time_feature8_2_7_10286,2);
target_workload1 = mean(solving_time_feature12_2_7_18830,2);

source_version = mean(solving_time_feature8_2_7_10286,2);
target_version = mean(solving_time_feature9_1_2_10286,2);

source_workload_version = mean(solving_time_feature9_1_2_10286,2);
target_workload_version = mean(solving_time_feature11_2_7_4435,2);

source_hardware_workload_version = mean(solving_time_feature1_2_7_10286,2);
target_hardware_workload_version = mean(solving_time_feature10_1_2_8287,2);

% determining invalid configurations
idx_invalid_source_hardware = (source_hardware>=5 );
idx_invalid_target_hardware = (target_hardware>=5 );
idx_valid_hardware = ~idx_invalid_source_hardware & ~idx_invalid_target_hardware;

idx_invalid_source_hardware1 = (source_hardware1>=5);
idx_invalid_target_hardware1 = (target_hardware1>=5);
idx_valid_hardware1 = ~idx_invalid_source_hardware1 & ~idx_invalid_target_hardware1;

idx_invalid_source_workload = (source_workload>=5 );
idx_invalid_target_workload = (target_workload>=5 );
idx_valid_workload = ~idx_invalid_source_workload & ~idx_invalid_target_workload;

idx_invalid_source_workload1 = (source_workload1>=5 );
idx_invalid_target_workload1 = (target_workload1>=5);
idx_valid_workload1 = ~idx_invalid_source_workload1 & ~idx_invalid_target_workload1;

idx_invalid_source_version = (source_version>=5);
idx_invalid_target_version = (target_version>=5);
idx_valid_version = ~idx_invalid_source_version & ~idx_invalid_target_version;

idx_invalid_source_workload_version = (source_workload_version>=5);
idx_invalid_target_workload_version = (target_workload_version>=5);
idx_valid_workload_version = ~idx_invalid_source_workload_version & ~idx_invalid_target_workload_version;

idx_invalid_source_hardware_workload_version = (source_hardware_workload_version>=5);
idx_invalid_target_hardware_workload_version = (target_hardware_workload_version>=5);
idx_valid_hardware_workload_version = ~idx_invalid_source_hardware_workload_version & ~idx_invalid_target_hardware_workload_version;



% calculate the measurements noise
% mean(var(solving_time_feature1_2_7_10286,0,2))
% mean(var(solving_time_amazon_2_7_10286,0,2))
% mean(var(solving_time_feature8_2_7_10286,0,2))
% mean(var(solving_time_feature9_1_2_10286,0,2))
% mean(var(solving_time_feature10_1_2_8287,0,2))
% mean(var(solving_time_feature11_2_7_4435,0,2))
% mean(var(solving_time_feature12_2_7_18830,0,2))

var_source_hardware = var(solving_time_feature1_2_7_10286(idx_valid_hardware,:),0,2);
var_target_hardware = var(solving_time_feature8_2_7_10286(idx_valid_hardware,:),0,2);
var_source_hardware1 = var(solving_time_amazon_2_7_10286(idx_valid_hardware1,:),0,2);
var_target_hardware1 = var(solving_time_feature8_2_7_10286(idx_valid_hardware1,:),0,2);

var_source_workload = var(solving_time_feature8_2_7_10286(idx_valid_workload,:),0,2);
var_target_workload = var(solving_time_feature11_2_7_4435(idx_valid_workload,:),0,2);
var_source_workload1 = var(solving_time_feature8_2_7_10286(idx_valid_workload1,:),0,2);
var_target_workload1 = var(solving_time_feature12_2_7_18830(idx_valid_workload1,:),0,2);

var_source_version = var(solving_time_feature8_2_7_10286(idx_valid_version,:),0,2);
var_target_version = var(solving_time_feature9_1_2_10286(idx_valid_version,:),0,2);

var_source_workload_version = var(solving_time_feature9_1_2_10286(idx_valid_workload_version,:),0,2);
var_target_workload_version = var(solving_time_feature11_2_7_4435(idx_valid_workload_version,:),0,2);

var_source_hardware_workload_version = var(solving_time_feature1_2_7_10286(idx_valid_hardware_workload_version,:),0,2);
var_target_hardware_workload_version = var(solving_time_feature10_1_2_8287(idx_valid_hardware_workload_version,:),0,2);

% H1.1: calculate the variance of differences

delta_hardware = abs(source_hardware(idx_valid_hardware) - target_hardware(idx_valid_hardware));
delta_hardware1 = abs(source_hardware1(idx_valid_hardware1) - target_hardware1(idx_valid_hardware1));
delta_workload = abs(source_workload(idx_valid_workload) - target_workload(idx_valid_workload));
delta_workload1 = abs(source_workload1(idx_valid_workload1) - target_workload1(idx_valid_workload1));
delta_version = abs(source_version(idx_valid_version) - target_version(idx_valid_version));
delta_workload_version = abs(source_workload_version(idx_valid_workload_version) - target_workload_version(idx_valid_workload_version));
delta_hardware_workload_version = abs(source_hardware_workload_version(idx_valid_hardware_workload_version) - target_hardware_workload_version(idx_valid_hardware_workload_version));

[sorted_delta_hardware,I_sorted_delta_hardware] = sort(delta_hardware);
[sorted_delta_hardware1,I_sorted_delta_hardware1] = sort(delta_hardware1);
[sorted_delta_workload,I_sorted_delta_workload] = sort(delta_workload);
[sorted_delta_workload1,I_sorted_delta_workload1] = sort(delta_workload1);
[sorted_delta_version,I_sorted_delta_version] = sort(delta_version);
[sorted_delta_workload_version,I_sorted_delta_workload_version] = sort(delta_workload_version);
[sorted_delta_hardware_workload_version,I_sorted_delta_hardware_workload_version] = sort(delta_hardware_workload_version);

trim_threshold = 0.95;

trimmed_sorted_delta_hardware = sorted_delta_hardware(1:trim_threshold*length(sorted_delta_hardware));
var_delta_hardware = var(trimmed_sorted_delta_hardware)
max_var_hardware_noise = max(var_source_hardware(I_sorted_delta_hardware)+var_target_hardware(I_sorted_delta_hardware))

var_delta_hardware_to_noise = var_delta_hardware/max_var_hardware_noise

trimmed_sorted_delta_hardware1 = sorted_delta_hardware1(1:trim_threshold*length(sorted_delta_hardware1));
var_delta_hardware1 = var(trimmed_sorted_delta_hardware1)
max_var_hardware1_noise = max(var_source_hardware1(I_sorted_delta_hardware1)+var_target_hardware1(I_sorted_delta_hardware1))

var_delta_hardware1_to_noise = var_delta_hardware1/max_var_hardware1_noise

trimmed_sorted_delta_workload = sorted_delta_workload(1:trim_threshold*length(sorted_delta_workload));
var_delta_workload = var(trimmed_sorted_delta_workload)
max_var_workload_noise = max(var_source_workload(I_sorted_delta_workload)+var_target_workload(I_sorted_delta_workload))

var_delta_workload_to_noise = var_delta_workload/max_var_workload_noise

trimmed_sorted_delta_workload1 = sorted_delta_workload1(1:trim_threshold*length(sorted_delta_workload1));
var_delta_workload1 = var(trimmed_sorted_delta_workload1)
max_var_workload1_noise = max(var_source_workload1(I_sorted_delta_workload1)+var_target_workload1(I_sorted_delta_workload1))

var_delta_workload1_to_noise = var_delta_workload1/max_var_workload1_noise

trimmed_sorted_delta_version = sorted_delta_version(1:trim_threshold*length(sorted_delta_version));
var_delta_version = var(trimmed_sorted_delta_version)
max_var_version_noise = max(var_source_version(I_sorted_delta_version)+var_target_version(I_sorted_delta_version))

var_delta_version_to_noise = var_delta_version/max_var_version_noise


trimmed_sorted_delta_workload_version = sorted_delta_workload_version(1:trim_threshold*length(sorted_delta_workload_version));
var_delta_workload_version = var(trimmed_sorted_delta_workload_version)
max_var_workload_version_noise = max(var_source_workload_version(I_sorted_delta_workload_version)+var_target_workload_version(I_sorted_delta_workload_version))

var_delta_workload_version_to_noise = var_delta_workload_version/max_var_workload_version_noise


trimmed_sorted_delta_hardware_workload_version = sorted_delta_hardware_workload_version(1:trim_threshold*length(sorted_delta_hardware_workload_version));
var_delta_hardware_workload_version = var(trimmed_sorted_delta_hardware_workload_version)
max_var_hardware_workload_version_noise = max(var_source_hardware_workload_version(I_sorted_delta_hardware_workload_version)+var_target_hardware_workload_version(I_sorted_delta_hardware_workload_version))

var_delta_hardware_workload_version_to_noise = var_delta_hardware_workload_version/max_var_hardware_workload_version_noise



% H1.2: calculating linear and rank correlations
corr_pear_hardware = corr(source_hardware(idx_valid_hardware) , target_hardware(idx_valid_hardware),'type','Pearson')
corr_pear_hardware1 = corr(source_hardware1(idx_valid_hardware1) , target_hardware1(idx_valid_hardware1),'type','Pearson')
corr_pear_workload = corr(source_workload(idx_valid_workload) , target_workload(idx_valid_workload),'type','Pearson')
corr_pear_workload1 = corr(source_workload1(idx_valid_workload1) , target_workload1(idx_valid_workload1),'type','Pearson')
corr_pear_version = corr(source_version(idx_valid_version) , target_version(idx_valid_version),'type','Pearson')
corr_pear_workload_version = corr(source_workload_version(idx_valid_workload_version) , target_workload_version(idx_valid_workload_version),'type','Pearson')
corr_pear_hardware_workload_version = corr(source_hardware_workload_version(idx_valid_hardware_workload_version) , target_hardware_workload_version(idx_valid_hardware_workload_version),'type','Pearson')

corr_spear_hardware = corr(source_hardware(idx_valid_hardware) , target_hardware(idx_valid_hardware),'type','Spearman')
corr_spear_hardware1 = corr(source_hardware1(idx_valid_hardware1) , target_hardware1(idx_valid_hardware1),'type','Spearman')
corr_spear_workload = corr(source_workload(idx_valid_workload) , target_workload(idx_valid_workload),'type','Spearman')
corr_spear_workload1 = corr(source_workload1(idx_valid_workload1) , target_workload1(idx_valid_workload1),'type','Spearman')
corr_spear_version = corr(source_version(idx_valid_version) , target_version(idx_valid_version),'type','Spearman')
corr_spear_workload_version = corr(source_workload_version(idx_valid_workload_version) , target_workload_version(idx_valid_workload_version),'type','Spearman')
corr_spear_hardware_workload_version = corr(source_hardware_workload_version(idx_valid_hardware_workload_version) , target_hardware_workload_version(idx_valid_hardware_workload_version),'type','Spearman')

% H1.2: performance distribution similarity
% adding epsilon in order to avoid zero values in the bins
N = 1000;

data_source = source_hardware(idx_valid_hardware);
data_target = target_hardware(idx_valid_hardware);
[~,bins_source] = discretize(data_source,N);
[~,bins_target] = discretize(data_target,N);
pd = fitdist(data_source,'Kernel');
pd_source = pdf(pd,bins_source);
pd = fitdist(data_target,'Kernel');
pd_target = pdf(pd,bins_target);
kl_hardware = KLDiv(pd_source,pd_target+eps)

data_source = source_hardware1(idx_valid_hardware1);
data_target = target_hardware1(idx_valid_hardware1);
[~,bins_source] = discretize(data_source,N);
[~,bins_target] = discretize(data_target,N);
pd = fitdist(data_source,'Kernel');
pd_source = pdf(pd,bins_source);
pd = fitdist(data_target,'Kernel');
pd_target = pdf(pd,bins_target);
kl_hardware1 = KLDiv(pd_source,pd_target+eps)

data_source = source_workload(idx_valid_workload);
data_target = target_workload(idx_valid_workload);
[~,bins_source] = discretize(data_source,N);
[~,bins_target] = discretize(data_target,N);
pd = fitdist(data_source,'Kernel');
pd_source = pdf(pd,bins_source);
pd = fitdist(data_target,'Kernel');
pd_target = pdf(pd,bins_target);
kl_workload = KLDiv(pd_source,pd_target+eps)

data_source = source_workload1(idx_valid_workload1);
data_target = target_workload1(idx_valid_workload1);
[~,bins_source] = discretize(data_source,N);
[~,bins_target] = discretize(data_target,N);
pd = fitdist(data_source,'Kernel');
pd_source = pdf(pd,bins_source);
pd = fitdist(data_target,'Kernel');
pd_target = pdf(pd,bins_target);
kl_workload1 = KLDiv(pd_source,pd_target+eps)

data_source = source_version(idx_valid_version);
data_target = target_version(idx_valid_version);
[~,bins_source] = discretize(data_source,N);
[~,bins_target] = discretize(data_target,N);
pd = fitdist(data_source,'Kernel');
pd_source = pdf(pd,bins_source);
pd = fitdist(data_target,'Kernel');
pd_target = pdf(pd,bins_target);
kl_version = KLDiv(pd_source,pd_target+eps)

data_source = source_workload_version(idx_valid_workload_version);
data_target = target_workload_version(idx_valid_workload_version);
[~,bins_source] = discretize(data_source,N);
[~,bins_target] = discretize(data_target,N);
pd = fitdist(data_source,'Kernel');
pd_source = pdf(pd,bins_source);
pd = fitdist(data_target,'Kernel');
pd_target = pdf(pd,bins_target);
kl_workload_version = KLDiv(pd_source,pd_target+eps)

data_source = source_hardware_workload_version(idx_valid_hardware_workload_version);
data_target = target_hardware_workload_version(idx_valid_hardware_workload_version);
[~,bins_source] = discretize(data_source,N);
[~,bins_target] = discretize(data_target,N);
pd = fitdist(data_source,'Kernel');
pd_source = pdf(pd,bins_source);
pd = fitdist(data_target,'Kernel');
pd_target = pdf(pd,bins_target);
kl_hardware_workload_version = KLDiv(pd_source,pd_target+eps)



% H1.3: top configurations
percentile = 0.2;

[~,idx_sort_source_hardware] = sort(source_hardware(idx_valid_hardware));
[~,idx_sort_target_hardware] = sort(target_hardware(idx_valid_hardware));
top_source_hardware = idx_sort_source_hardware(1:length(idx_sort_source_hardware)*percentile);
top_target_hardware = idx_sort_target_hardware(1:length(idx_sort_target_hardware)*percentile);
top_per_intersect_hardware = length(intersect(top_source_hardware,top_target_hardware))/length(top_target_hardware)
bottom_source_hardware = idx_sort_source_hardware(end-length(idx_sort_source_hardware)*percentile:end);
bottom_target_hardware = idx_sort_target_hardware(end-length(idx_sort_target_hardware)*percentile:end);
bottom_per_intersect_hardware = length(intersect(bottom_source_hardware,bottom_target_hardware))/length(top_target_hardware)

[~,idx_sort_source_hardware1] = sort(source_hardware1(idx_valid_hardware1));
[~,idx_sort_target_hardware1] = sort(target_hardware1(idx_valid_hardware1));
top_source_hardware1 = idx_sort_source_hardware1(1:length(idx_sort_source_hardware1)*percentile);
top_target_hardware1 = idx_sort_target_hardware1(1:length(idx_sort_target_hardware1)*percentile);
top_per_intersect_hardware1 = length(intersect(top_source_hardware1,top_target_hardware1))/length(top_target_hardware1)
bottom_source_hardware1 = idx_sort_source_hardware1(end-length(idx_sort_source_hardware1)*percentile:end);
bottom_target_hardware1 = idx_sort_target_hardware1(end-length(idx_sort_target_hardware1)*percentile:end);
bottom_per_intersect_hardware1 = length(intersect(bottom_source_hardware1,bottom_target_hardware1))/length(top_target_hardware1)

[~,idx_sort_source_workload] = sort(source_workload(idx_valid_workload));
[~,idx_sort_target_workload] = sort(target_workload(idx_valid_workload));
top_source_workload = idx_sort_source_workload(1:length(idx_sort_source_workload)*percentile);
top_target_workload = idx_sort_target_workload(1:length(idx_sort_target_workload)*percentile);
top_per_intersect_workload = length(intersect(top_source_workload,top_target_workload))/length(top_target_workload)
bottom_source_workload = idx_sort_source_workload(end-length(idx_sort_source_workload)*percentile:end);
bottom_target_workload = idx_sort_target_workload(end-length(idx_sort_target_workload)*percentile:end);
bottom_per_intersect_workload = length(intersect(bottom_source_workload,bottom_target_workload))/length(top_target_workload)

[~,idx_sort_source_workload1] = sort(source_workload1(idx_valid_workload1));
[~,idx_sort_target_workload1] = sort(target_workload1(idx_valid_workload1));
top_source_workload1 = idx_sort_source_workload1(1:length(idx_sort_source_workload1)*percentile);
top_target_workload1 = idx_sort_target_workload1(1:length(idx_sort_target_workload1)*percentile);
top_per_intersect_workload1 = length(intersect(top_source_workload1,top_target_workload1))/length(top_target_workload1)
bottom_source_workload1 = idx_sort_source_workload1(end-length(idx_sort_source_workload1)*percentile:end);
bottom_target_workload1 = idx_sort_target_workload1(end-length(idx_sort_target_workload1)*percentile:end);
bottom_per_intersect_workload1 = length(intersect(bottom_source_workload1,bottom_target_workload1))/length(top_target_workload1)

[~,idx_sort_source_version] = sort(source_version(idx_valid_version));
[~,idx_sort_target_version] = sort(target_version(idx_valid_version));
top_source_version = idx_sort_source_version(1:length(idx_sort_source_version)*percentile);
top_target_version = idx_sort_target_version(1:length(idx_sort_target_version)*percentile);
top_per_intersect_version = length(intersect(top_source_version,top_target_version))/length(top_target_version)
bottom_source_version = idx_sort_source_version(end-length(idx_sort_source_version)*percentile:end);
bottom_target_version = idx_sort_target_version(end-length(idx_sort_target_version)*percentile:end);
bottom_per_intersect_version = length(intersect(bottom_source_version,bottom_target_version))/length(top_target_version)

[~,idx_sort_source_workload_version] = sort(source_workload_version(idx_valid_workload_version));
[~,idx_sort_target_workload_version] = sort(target_workload_version(idx_valid_workload_version));
top_source_workload_version = idx_sort_source_workload_version(1:length(idx_sort_source_workload_version)*percentile);
top_target_workload_version = idx_sort_target_workload_version(1:length(idx_sort_target_workload_version)*percentile);
top_per_intersect_workload_version = length(intersect(top_source_workload_version,top_target_workload_version))/length(top_target_workload_version)
bottom_source_workload_version = idx_sort_source_workload_version(end-length(idx_sort_source_workload_version)*percentile:end);
bottom_target_workload_version = idx_sort_target_workload_version(end-length(idx_sort_target_workload_version)*percentile:end);
bottom_per_intersect_workload_version = length(intersect(bottom_source_workload_version,bottom_target_workload_version))/length(top_target_workload_version)

[~,idx_sort_source_hardware_workload_version] = sort(source_hardware_workload_version(idx_valid_hardware_workload_version));
[~,idx_sort_target_hardware_workload_version] = sort(target_hardware_workload_version(idx_valid_hardware_workload_version));
top_source_hardware_workload_version = idx_sort_source_hardware_workload_version(1:length(idx_sort_source_hardware_workload_version)*percentile);
top_target_hardware_workload_version = idx_sort_target_hardware_workload_version(1:length(idx_sort_target_hardware_workload_version)*percentile);
top_per_intersect_hardware_workload_version = length(intersect(top_source_hardware_workload_version,top_target_hardware_workload_version))/length(top_target_hardware_workload_version)
bottom_source_hardware_workload_version = idx_sort_source_hardware_workload_version(end-length(idx_sort_source_hardware_workload_version)*percentile:end);
bottom_target_hardware_workload_version = idx_sort_target_hardware_workload_version(end-length(idx_sort_target_hardware_workload_version)*percentile:end);
bottom_per_intersect_hardware_workload_version = length(intersect(bottom_source_hardware_workload_version,bottom_target_hardware_workload_version))/length(top_target_hardware_workload_version)



% H2.1: t-test
ttest_hardware = ttest_proc(configurations(idx_valid_hardware,:), source_hardware(idx_valid_hardware), target_hardware(idx_valid_hardware))
ttest_hardware1 = ttest_proc(configurations(idx_valid_hardware1,:), source_hardware1(idx_valid_hardware1), target_hardware1(idx_valid_hardware1))
ttest_workload = ttest_proc(configurations(idx_valid_workload,:), source_workload(idx_valid_workload), target_workload(idx_valid_workload))
ttest_workload1 = ttest_proc(configurations(idx_valid_workload1,:), source_workload1(idx_valid_workload1), target_workload1(idx_valid_workload1))
ttest_version = ttest_proc(configurations(idx_valid_version,:), source_version(idx_valid_version), target_version(idx_valid_version))
ttest_workload_version = ttest_proc(configurations(idx_valid_workload_version,:), source_workload_version(idx_valid_workload_version), target_workload_version(idx_valid_workload_version))
ttest_workload_hardware_workload_version = ttest_proc(configurations(idx_valid_hardware_workload_version,:), source_hardware_workload_version(idx_valid_hardware_workload_version), target_hardware_workload_version(idx_valid_hardware_workload_version))


% H2.2: tree
tree_s = fitrtree(configurations(idx_valid_hardware,:),source_hardware(idx_valid_hardware),'CategoricalPredictors','all');
tree_t = fitrtree(configurations(idx_valid_hardware,:),target_hardware(idx_valid_hardware),'CategoricalPredictors','all');
imp_tree_s = predictorImportance(tree_s);
imp_tree_t = predictorImportance(tree_t);
corr_tree_hardware = corr(imp_tree_s',imp_tree_t','type','Pearson')

tree_s = fitrtree(configurations(idx_valid_hardware1,:),source_hardware1(idx_valid_hardware1),'CategoricalPredictors','all');
tree_t = fitrtree(configurations(idx_valid_hardware1,:),target_hardware1(idx_valid_hardware1),'CategoricalPredictors','all');
imp_tree_s = predictorImportance(tree_s);
imp_tree_t = predictorImportance(tree_t);
corr_tree_hardware1 = corr(imp_tree_s',imp_tree_t','type','Pearson')

tree_s = fitrtree(configurations(idx_valid_workload,:),source_workload(idx_valid_workload),'CategoricalPredictors','all');
tree_t = fitrtree(configurations(idx_valid_workload,:),target_workload(idx_valid_workload),'CategoricalPredictors','all');
imp_tree_s = predictorImportance(tree_s);
imp_tree_t = predictorImportance(tree_t);
corr_tree_workload = corr(imp_tree_s',imp_tree_t','type','Pearson')

tree_s = fitrtree(configurations(idx_valid_workload1,:),source_workload1(idx_valid_workload1),'CategoricalPredictors','all');
tree_t = fitrtree(configurations(idx_valid_workload1,:),target_workload1(idx_valid_workload1),'CategoricalPredictors','all');
imp_tree_s = predictorImportance(tree_s);
imp_tree_t = predictorImportance(tree_t);
corr_tree_workload1 = corr(imp_tree_s',imp_tree_t','type','Pearson')

tree_s = fitrtree(configurations(idx_valid_version,:),source_version(idx_valid_version),'CategoricalPredictors','all');
tree_t = fitrtree(configurations(idx_valid_version,:),target_version(idx_valid_version),'CategoricalPredictors','all');
imp_tree_s = predictorImportance(tree_s);
imp_tree_t = predictorImportance(tree_t);
corr_tree_version = corr(imp_tree_s',imp_tree_t','type','Pearson')

tree_s = fitrtree(configurations(idx_valid_workload_version,:),source_workload_version(idx_valid_workload_version),'CategoricalPredictors','all');
tree_t = fitrtree(configurations(idx_valid_workload_version,:),target_workload_version(idx_valid_workload_version),'CategoricalPredictors','all');
imp_tree_s = predictorImportance(tree_s);
imp_tree_t = predictorImportance(tree_t);
corr_tree_workload_version = corr(imp_tree_s',imp_tree_t','type','Pearson')

tree_s = fitrtree(configurations(idx_valid_hardware_workload_version,:),source_hardware_workload_version(idx_valid_hardware_workload_version),'CategoricalPredictors','all');
tree_t = fitrtree(configurations(idx_valid_hardware_workload_version,:),target_hardware_workload_version(idx_valid_hardware_workload_version),'CategoricalPredictors','all');
imp_tree_s = predictorImportance(tree_s);
imp_tree_t = predictorImportance(tree_t);
corr_tree_hardware_workload_version = corr(imp_tree_s',imp_tree_t','type','Pearson')


% H3.1-2: feature interactions

[results_model_hardware,results_stepwise_hardware] = learn_model(configurations(idx_valid_hardware,:),source_hardware(idx_valid_hardware), target_hardware(idx_valid_hardware))
[results_model_hardware1,results_stepwise_hardware1] = learn_model(configurations(idx_valid_hardware1,:),source_hardware1(idx_valid_hardware1), target_hardware1(idx_valid_hardware1))
[results_model_workload,results_stepwise_workload] = learn_model(configurations(idx_valid_workload,:), source_workload(idx_valid_workload), target_workload(idx_valid_workload))
[results_model_workload1,results_stepwise_workload1] = learn_model(configurations(idx_valid_workload1,:), source_workload1(idx_valid_workload1), target_workload1(idx_valid_workload1))
[results_model_version,results_stepwise_version] = learn_model(configurations(idx_valid_version,:), source_version(idx_valid_version), target_version(idx_valid_version))
[results_model_workload_version,results_stepwise_workload_version] = learn_model(configurations(idx_valid_workload_version,:), source_workload_version(idx_valid_workload_version), target_workload_version(idx_valid_workload_version))
[results_model_hardware_workload_version,results_stepwise_hardware_workload_version] = learn_model(configurations(idx_valid_hardware_workload_version,:), source_hardware_workload_version(idx_valid_hardware_workload_version), target_hardware_workload_version(idx_valid_hardware_workload_version))

% H4.1: invalid configurations

ratio_invalid_source_hardware = length(find(idx_invalid_source_hardware))/length(source_hardware)
ratio_invalid_target_hardware = length(find(idx_invalid_target_hardware))/length(target_hardware)
ratio_invalid_hardware = length(find(~idx_valid_hardware))/length(find(idx_invalid_source_hardware | idx_invalid_target_hardware))

ratio_invalid_source_hardware1 = length(find(idx_invalid_source_hardware1))/length(source_hardware1)
ratio_invalid_target_hardware1 = length(find(idx_invalid_target_hardware1))/length(target_hardware1)
ratio_invalid_hardware1 = length(find(~idx_valid_hardware1))/length(find(idx_invalid_source_hardware1 | idx_invalid_target_hardware1))

ratio_invalid_source_workload = length(find(idx_invalid_source_workload))/length(source_workload)
ratio_invalid_target_workload = length(find(idx_invalid_target_workload))/length(target_workload)
ratio_invalid_workload = length(find(~idx_valid_workload))/length(find(idx_invalid_source_workload | idx_invalid_target_workload))

ratio_invalid_source_workload1 = length(find(idx_invalid_source_workload1))/length(source_workload1)
ratio_invalid_target_workload1 = length(find(idx_invalid_target_workload1))/length(target_workload1)
ratio_invalid_workload1 = length(find(~idx_valid_workload1))/length(find(idx_invalid_source_workload1 | idx_invalid_target_workload1))

ratio_invalid_source_version = length(find(idx_invalid_source_version))/length(source_version)
ratio_invalid_target_version = length(find(idx_invalid_target_version))/length(target_version)
ratio_invalid_version = length(find(~idx_valid_version))/length(find(idx_invalid_source_version | idx_invalid_target_version))

ratio_invalid_source_workload_version = length(find(idx_invalid_source_workload_version))/length(source_workload_version)
ratio_invalid_target_workload_version = length(find(idx_invalid_target_workload_version))/length(target_workload_version)
ratio_invalid_workload_version = length(find(~idx_valid_workload_version))/length(find(idx_invalid_source_workload_version | idx_invalid_target_workload_version))

ratio_invalid_source_hardware_workload_version = length(find(idx_invalid_source_hardware_workload_version))/length(source_hardware_workload_version)
ratio_invalid_target_hardware_workload_version = length(find(idx_invalid_target_hardware_workload_version))/length(target_hardware_workload_version)
ratio_invalid_hardware_workload_version = length(find(~idx_valid_hardware_workload_version))/length(find(idx_invalid_source_hardware_workload_version | idx_invalid_target_hardware_workload_version))

% H4.2: classifier reusability

[B_source_hardware] = mnrfit(configurations,categorical(idx_invalid_source_hardware));
[B_target_hardware] = mnrfit(configurations,categorical(idx_invalid_target_hardware));
corr_class_hardware = corr(B_source_hardware,B_target_hardware)

[B_source_hardware1] = mnrfit(configurations,categorical(idx_invalid_source_hardware1));
[B_target_hardware1] = mnrfit(configurations,categorical(idx_invalid_target_hardware1));
corr_class_hardware1 = corr(B_source_hardware1,B_target_hardware1)

[B_source_workload] = mnrfit(configurations,categorical(idx_invalid_source_workload));
[B_target_workload] = mnrfit(configurations,categorical(idx_invalid_target_workload));
corr_class_workload = corr(B_source_workload,B_target_workload)

[B_source_workload1] = mnrfit(configurations,categorical(idx_invalid_source_workload1));
[B_target_workload1] = mnrfit(configurations,categorical(idx_invalid_target_workload1));
corr_class_workload1 = corr(B_source_workload1,B_target_workload1)

[B_source_version] = mnrfit(configurations,categorical(idx_invalid_source_version));
[B_target_version] = mnrfit(configurations,categorical(idx_invalid_target_version));
corr_class_version = corr(B_source_version,B_target_version)

[B_source_workload_version] = mnrfit(configurations,categorical(idx_invalid_source_workload_version));
[B_target_workload_version] = mnrfit(configurations,categorical(idx_invalid_target_workload_version));
corr_class_workload_version = corr(B_source_workload_version,B_target_workload_version)

[B_source_hardware_workload_version] = mnrfit(configurations,categorical(idx_invalid_source_hardware_workload_version));
[B_target_hardware_workload_version] = mnrfit(configurations,categorical(idx_invalid_target_hardware_workload_version));
corr_class_hardware_workload_version = corr(B_source_hardware_workload_version,B_target_hardware_workload_version)


%%% creating table

input.data = [corr_pear_hardware kl_hardware corr_spear_hardware top_per_intersect_hardware bottom_per_intersect_hardware ttest_hardware corr_tree_hardware results_stepwise_hardware ratio_invalid_source_hardware ratio_invalid_target_hardware ratio_invalid_hardware corr_class_hardware; ...
corr_pear_hardware1 kl_hardware1 corr_spear_hardware1 top_per_intersect_hardware1 bottom_per_intersect_hardware1 ttest_hardware1 corr_tree_hardware1 results_stepwise_hardware1 ratio_invalid_source_hardware1 ratio_invalid_target_hardware1 ratio_invalid_hardware1 corr_class_hardware1;
corr_pear_workload kl_workload corr_spear_workload top_per_intersect_workload bottom_per_intersect_workload ttest_workload corr_tree_workload results_stepwise_workload ratio_invalid_source_workload ratio_invalid_target_workload ratio_invalid_workload corr_class_workload
corr_pear_workload1 kl_workload1 corr_spear_workload1 top_per_intersect_workload1 bottom_per_intersect_workload1 ttest_workload1 corr_tree_workload1 results_stepwise_workload1 ratio_invalid_source_workload1 ratio_invalid_target_workload1 ratio_invalid_workload1 corr_class_workload1
corr_pear_version kl_version corr_spear_version top_per_intersect_version bottom_per_intersect_version ttest_version corr_tree_version results_stepwise_version ratio_invalid_source_version ratio_invalid_target_version ratio_invalid_version corr_class_version
corr_pear_workload_version kl_workload_version corr_spear_workload_version top_per_intersect_workload_version bottom_per_intersect_workload_version ttest_workload_version corr_tree_workload_version results_stepwise_workload_version ratio_invalid_source_workload_version ratio_invalid_target_workload_version ratio_invalid_workload_version corr_class_workload_version
corr_pear_hardware_workload_version kl_hardware_workload_version corr_spear_hardware_workload_version top_per_intersect_hardware_workload_version bottom_per_intersect_hardware_workload_version ttest_workload_hardware_workload_version corr_tree_hardware_workload_version results_stepwise_hardware_workload_version ratio_invalid_source_hardware_workload_version ratio_invalid_target_hardware_workload_version ratio_invalid_hardware_workload_version corr_class_hardware_workload_version
];

% Set column labels (use empty string for no label):
input.tableColLabels = {'M1','M2','M3','M4','M5','M6','M7','M8','M9','M10','M11','M12','M13','M14','M15','M16','M17','M18','M19'};
% Set row labels (use empty string for no label):
input.tableRowLabels = {'h','h1','w','w1','v','wv','hwv'};

% Switch transposing/pivoting your table:
input.transposeTable = 0;

% Determine whether input.dataFormat is applied column or row based:
input.dataFormatMode = 'column'; % use 'column' or 'row'. if not set 'colum' is used

input.dataFormat = {'%.2f',19}; % three digits precision for first two columns, one digit for the last

% Define how NaN values in input.tableData should be printed in the LaTex table:
input.dataNanString = '-';

% Column alignment in Latex table ('l'=left-justified, 'c'=centered,'r'=right-justified):
input.tableColumnAlignment = 'c';

% Switch table borders on/off (borders are enabled by default):
input.tableBorders = 0;

% LaTex table caption:
input.tableCaption = 'Results';

% LaTex table label:
input.tableLabel = 'results';

% Switch to generate a complete LaTex document or just a table:
input.makeCompleteLatexDocument = 0;

% call latexTable:
latex = latexTable(input);

%%%%%%%%%%%%%%%%%%%%%%
var_delta_hardware_to_noise
var_delta_hardware1_to_noise
var_delta_workload_to_noise
var_delta_workload1_to_noise
var_delta_version_to_noise
var_delta_workload_version_to_noise
var_delta_hardware_workload_version_to_noise


corr_pear_hardware
corr_pear_hardware1
corr_pear_workload
corr_pear_workload1
corr_pear_version
corr_pear_workload_version
corr_pear_hardware_workload_version

corr_spear_hardware
corr_spear_hardware1
corr_spear_workload
corr_spear_workload1
corr_spear_version
corr_spear_workload_version
corr_spear_hardware_workload_version

top_per_intersect_hardware
top_per_intersect_hardware1
top_per_intersect_workload
top_per_intersect_workload1
top_per_intersect_version
top_per_intersect_workload_version
top_per_intersect_hardware_workload_version

bottom_per_intersect_hardware
bottom_per_intersect_hardware1
bottom_per_intersect_workload
bottom_per_intersect_workload1
bottom_per_intersect_version
bottom_per_intersect_workload_version
bottom_per_intersect_hardware_workload_version

ttest_hardware
ttest_workload
ttest_version
ttest_workload_version
ttest_workload_hardware_workload_version


results_stepwise_hardware
results_stepwise_workload
results_stepwise_version
results_stepwise_workload_version
results_stepwise_hardware_workload_version

ratio_invalid_source_hardware
ratio_invalid_target_hardware
ratio_invalid_hardware
ratio_invalid_source_workload
ratio_invalid_target_workload
ratio_invalid_workload
ratio_invalid_source_version
ratio_invalid_target_version
ratio_invalid_version
ratio_invalid_source_workload_version
ratio_invalid_target_workload_version
ratio_invalid_workload_version
ratio_invalid_source_hardware_workload_version
ratio_invalid_target_hardware_workload_version
ratio_invalid_hardware_workload_version

corr_class_hardware
corr_class_workload
corr_class_version
corr_class_workload_version
corr_class_hardware_workload_version

%%%%%%%%%%%%%%%%%%%%%%
% hist(solving_time_feature8_2_7_10286(idx_valid)./solving_time_feature1_2_7_10286(idx_valid))
% hist(solving_time_feature8_2_7_10286(idx_valid) - solving_time_feature1_2_7_10286(idx_valid))
% 
% var(source_hardware(idx_valid) - target_hardware(idx_valid))
% 
% xx = sort(mean(solving_time_feature8_2_7_10286(idx_valid),2) - mean(solving_time_feature1_2_7_10286(idx_valid),2));
% var(xx(0.5*length(xx):end))
% 
% % histograms
% figure(2)
% h=histfit(solving_time_feature8_2_7_10286(idx_valid) - solving_time_feature1_2_7_10286(idx_valid),50,'kernel');
% h(1).FaceColor = [.8 .8 1];
% h(2).Color = [.2 .2 .2];
% xlabel('Difference');
% ylabel('frequency');
% fontset
% 
% probplot(solving_time_feature8_2_7_10286(idx_valid,1) - solving_time_feature1_2_7_10286(idx_valid,1))
% 
% probplot(solving_time_feature8_2_7_10286(idx_valid,1)./solving_time_feature1_2_7_10286(idx_valid,1))

