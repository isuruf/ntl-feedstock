echo copy %RECIPE_DIR%\windows\CMakeLists.gen_gmp_aux.txt ntl/CMakeLists.txt
copy %RECIPE_DIR%\CMakeLists.gen_gmp_aux.txt ntl/CMakeLists.txt

cmake -G "%CMAKE_GENERATOR%" ^
      -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
      -DCMAKE_PREFIX_PATH=%LIBRARY_PREFIX% ^
      -DCMAKE_BUILD_TYPE=Release ^
      ntl

cmake --build .

gen_gmp_aux.exe > ntl/include/NTL/gmp_aux.h
del gen_gmp_aux.exe

echo copy %RECIPE_DIR%\windows\CMakeLists.txt ntl/CMakeLists.txt
copy %RECIPE_DIR%/CMakeLists.txt ntl/CMakeLists.txt

cmake -G "%CMAKE_GENERATOR%" ^
      -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
      -DCMAKE_PREFIX_PATH=%LIBRARY_PREFIX% ^
      -DCMAKE_BUILD_TYPE=Release ^
      ntl

cmake --build . --target install --config Release
