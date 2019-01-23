copy %RECIPE_DIR%\windows\CMakeLists.gen_gmp_aux.txt ntl\CMakeLists.txt
copy %RECIPE_DIR%\windows\gen_gmp_aux.cpp ntl\gen_gmp_aux.cpp

cmake -G "%CMAKE_GENERATOR%" ^
      -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
      -DCMAKE_PREFIX_PATH=%LIBRARY_PREFIX% ^
      -DCMAKE_BUILD_TYPE=Release ^
      ntl

cmake --build .

gen_gmp_aux.exe > ntl/include/NTL/gmp_aux.h
del gen_gmp_aux.exe
del ntl\gen_gmp_aux.cpp

copy %RECIPE_DIR%\windows\CMakeLists.txt ntl\CMakeLists.txt

cmake -G "%CMAKE_GENERATOR%" ^
      -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
      -DCMAKE_PREFIX_PATH=%LIBRARY_PREFIX% ^
      -DCMAKE_BUILD_TYPE=Release ^
      ntl

cmake --build . --target install --config Release
