mkdir gen
cd gen

copy %RECIPE_DIR%\windows\CMakeLists.gen_gmp_aux.txt CMakeLists.txt
copy %RECIPE_DIR%\windows\gen_gmp_aux.cpp gen_gmp_aux.cpp

cmake -G "%CMAKE_GENERATOR%" ^
      -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
      -DCMAKE_PREFIX_PATH=%LIBRARY_PREFIX% ^
      -DCMAKE_BUILD_TYPE=Release ^
      .

cmake --build .

Release\gen_gmp_aux.exe > ..\include\NTL\gmp_aux.h

cd ..

copy %RECIPE_DIR%\windows\CMakeLists.txt CMakeLists.txt

cmake -G "%CMAKE_GENERATOR%" ^
      -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
      -DCMAKE_PREFIX_PATH=%LIBRARY_PREFIX% ^
      -DCMAKE_BUILD_TYPE=Release ^
      .

cmake --build . --target install --config Release
