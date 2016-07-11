#include "mex.h"

void mexFunction( int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[])
{
    mxArray *inscalar;
    double inscalar_value;
    double outscalar_value;

    mxArray *inarray;
    double *inarray_ptr;
    int array_row,
        array_col;
    double inarray_value[2][4];
    double *outarray_ptr;
    double outarray_value[2*4];

    int i, j;
    
    //-----import data from matlab-----//
    //import scalar
    inscalar = prhs[0];
    inscalar_value = mxGetScalar(inscalar);
    printf("scalar: %f\n", inscalar_value);
    //import array
    inarray = prhs[1];
    inarray_ptr = mxGetPr(inarray);
    array_col = mxGetM(inarray);
    array_row = mxGetN(inarray);
    printf("array_col = %d\n", array_col);
    printf("array_row = %d\n", array_row);
    for(i = 0; i < array_row*array_col; i++)
    {
        printf("inarray[%d] = %f\n", i, *(inarray_ptr + i));
    }
    for(i = 0; i < array_col; i++)
    {
        for(j = 0; j < array_row; j++)
        {
            inarray_value[i][j] = *(inarray_ptr + i*array_row + j);
            printf("inarray_value[%d][%d] = %f\n", i, j, inarray_value[i][j]);
        }
    }

    //main
    outscalar_value = inscalar_value + 100;
    
    for(i = 0; i < array_col; i++)
    {
        for(j = 0; j < array_row; j++)
        {
            outarray_value[i*array_row + j] = inarray_value[i][j] + 2;
        }
    }

    //end main
    
    
    //-----export data to matlab-----//
    //export scalar
    plhs[0] = mxCreateDoubleScalar(outscalar_value);
    
    //export array
    outarray_ptr = (double *) mxMalloc(array_row*array_col*sizeof(double));
    for(i = 0; i < array_col; i++)
    {
        for(j = 0; j < array_row; j++)
        {
            outarray_ptr[i*array_row + j] = outarray_value[i*array_row + j];
        }
    }
    plhs[1] = mxCreateDoubleMatrix(array_col, array_row, mxREAL);   
    mxSetPr(plhs[1], outarray_ptr);
    
    return;
}