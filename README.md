# pngio
Short &amp; simple example of handling PNGs in C++ with libpng

## Example usage

Don't forget to link with `-lpng` and `-lz`.

```cpp
#include "pngio.h"
#include <iostream>

using namespace std;

int main(int argc, char * argv[]) {
    try {
        if (argc != 2) {
            throw runtime_error("USAGE: " + string(argv[0]) + " file");
        }

        string fname = argv[1];
        ImageRGB img = readpng(fname);

        ImageRGB img_whacky;
        img_whacky.width = img.width;
        img_whacky.height = img.height;

        for (size_t i = 0; i < img.height; ++i) {
            for (size_t j = 0; j < img.width; ++j) {
                uint8_t r = get<0>(img.data[i * img.width + j]);
                uint8_t g = get<1>(img.data[i * img.width + j]);
                uint8_t b = get<2>(img.data[i * img.width + j]);

                // Do something crazy...
                img_whacky.data.push_back({b,r,g});
            }
        }

        writepng("whacky_" + fname, img_whacky);
    } catch (exception & e) {
        cout << "Error: " << e.what() << endl;
    }

    return 0;
}
```

