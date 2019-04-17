
#ifdef __cplusplus
extern "C"
#endif
float GetFocusScore(unsigned char *imgdata, int width, int height, int pitch, int lft, int top, int rgt, int btm);

#ifdef __cplusplus
extern "C"
#endif
int BankCardNV21(unsigned char *pbResult, int nMaxSize, unsigned char *pbNV21, int iW, int iH, int iLft, int iTop, int iRgt, int iBtm);

#ifdef __cplusplus
extern "C"
#endif
int BankCardNV12(unsigned char *pbResult, int nMaxSize, unsigned char *pbNV12, int iW, int iH, int iLft, int iTop, int iRgt, int iBtm);

#ifdef __cplusplus
extern "C"
#endif
int BankCard32(unsigned char *pbResult, int nMaxSize, unsigned char *pbImg32, int iW, int iH, int iPitch);

