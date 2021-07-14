import json
import os
import shutil
import pathlib
import tarfile


# tar -zcvf test.tar.gz  *

def copy(tar_path):
    assert tarfile.is_tarfile(tar_path + ".tar.gz")
    tar = tarfile.open(tar_path + ".tar.gz")
    meta_content = tar.extractfile("meta.json").read()
    # print(meta_content)
    meta_json = json.loads(meta_content.decode('utf-8'))

    for dest_path, file_names in meta_json.items():
        for file_name in file_names:
            print(file_name, dest_path)
            file_content = tar.extractfile(file_name).read()
            if not os.path.exists(dest_path):
                pathlib.Path(dest_path).mkdir(parents=True, exist_ok=True)
            f = open(os.path.join(dest_path, file_name), "wb")
            f.write(file_content)
            f.close()


copy("test")
