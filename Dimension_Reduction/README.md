## Running Experiments

https://github.com/CancerGenome/ML_assignment3

Run Own dataset

Run own dataset:
Edit run_experiment.py and replace my code:

    dataset1_details = {
            'data': loader.TITANICData(verbose=verbose, seed=seed),
            'name': 'Titanic',
            'readable_name': 'Titanic',
            'best_nn_params': {'NN__activation': ['relu'], 'NN__alpha': [1.0],
                               'NN__hidden_layer_sizes': [(3,5)], 'NN__learning_rate_init': [0.016]}
    }

python3 run_experiment.py  --dataset1 --all
python3 run_experiment.py  --dataset2 --all

Plot all figures
python3.7 run_experiment.py --plot

Dimension used for dataset 1 clustering:
PCA: 4
ICA: 5
RP: 5
RF: 5
Dataset2 clustering:
PCA: 6;
ICA: 5;
RP: 8
RF: 5

Decide dimension for cluster (real cluster number), re run run_clustering.sh
Sh run_clustering.sh

Re plot-everything:
python3,7 run_experiment.py --plot

