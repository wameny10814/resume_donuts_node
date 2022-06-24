function genObject(){
    return {
        name: 'peter',
        age:26,
    }
}

genObject.method01 = ()=>{
    console.log('method01')
}

const obj = genObject();
console.log("obj:",obj);
genObject.method01();

console.log("genObject:",genObject.constructor.name);
console.log(genObject.name);
console.log(genObject);

console.log("obj.name:",obj.name);
console.log(genObject().name);