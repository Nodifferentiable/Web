from flask import Flask, request
from gevent import pywsgi
from service.air_quality_service import getData

app = Flask(__name__)


@app.route('/getData', methods=['GET'])
def getData1():
    provinceName = request.args.get('provinceName')
    getData(provinceName)
    return 'success'


if __name__ == '__main__':
    # server = pywsgi.WSGIServer(('127.0.0.1', 5000), app)
    # server.serve_forever()
    app.run('127.0.0.1', 5000, debug=True)
