Caltech Pedestrian Dataset Converter
============================

## Requirements

- OpenCV 3.0+ (with Python binding)
- Python 2.7+, 3.4+, 3.5+
- NumPy 1.10+
- SciPy 0.16+

## Caltech Pedestrian Dataset
- Make a directory for saving Caltech Pedestrian Dataset (called `${PATH_TO_CALTECH}`).

- Create a symlink :
    ```Shell
    $ ln -s ${PATH_TO_CALTECH} data
    ```

- Download datasets:
   ```Shell
   $ bash shells/download.sh
   ```
   - If you want download ***in parallel***, run `$ bash shells/download_parallel.sh` instead.

- Convert annotation files to one unified JSON file (`${PATH_TO_CALTECH}/annotations.json`):
    ```Shell
    $ python scripts/convert_annotations.py
    ```
    - Number of objects: 346621

- Separate each `.seq` movie into `.png` images :
    ```Shell
    $ python scripts/convert_seqs.py
    ```
    - Each image's filename is consisted of `{set**}_{V***}_{frame_num}.png`.
    - According to [the official site](http://www.vision.caltech.edu/Image_Datasets/CaltechPedestrians/), `set06`~`set10` are for test dataset, while the rest are for training dataset.

## Draw Bounding Boxes

```Shell
$ python tests/test_plot_annotations.py
```
