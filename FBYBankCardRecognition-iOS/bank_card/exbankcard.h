
#ifndef __EX_BANK_CARD_H__
#define __EX_BANK_CARD_H__

#ifdef __cplusplus
extern "C"
#endif
int BankCardRecoFile(const char *szImgFile, unsigned char *pbResult, int nMaxSize);

#ifdef __cplusplus
extern "C"
#endif
int BankCard24(unsigned char *pbResult, int nMaxSize, unsigned char *pbImg24, int iW, int iH, int iPitch, int iLft, int iTop, int iRgt, int iBtm);

#ifdef __cplusplus
extern "C"
#endif
int BankCard32(unsigned char *pbResult, int nMaxSize, unsigned char *pbImg32, int iW, int iH, int iPitch, int iLft, int iTop, int iRgt, int iBtm);

#ifdef __cplusplus
extern "C"
#endif
int BankCardNV21(unsigned char *pbResult, int nMaxSize, unsigned char *pbY, unsigned char *pbVU, int iW, int iH, int iLft, int iTop, int iRgt, int iBtm);

#ifdef __cplusplus
extern "C"
#endif
int BankCardNV12(unsigned char *pbResult, int nMaxSize, unsigned char *pbY, unsigned char *pbUV, int iW, int iH, int iLft, int iTop, int iRgt, int iBtm);

#ifdef __cplusplus
extern "C"
#endif
float GetFocusScore(unsigned char *imgdata, int width, int height, int pitch, int lft, int top, int rgt, int btm);


#endif 
